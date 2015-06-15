% Student DSSS bandwidth exercise
% Author: David Rupprecht (david.rupprecht@rub.de)
% Please do NOT contact the author if you have problems or questions
% regarding this exercise. Instead contact one of the lab assistants.
% We simulate BER of DSSS and narrowband signal as a function of jammer to
% transmission power ratio.
% We assume coherent receiver and perfect synchronization.
clear all;
close all;

%Please be patient, while the script is working !!!
fprintf('Please be patient, while the script is working !!!\n');

%variables that define system configuration
%generate appropriate time samples (only for simulation reasons)
Fs = 10e3; % 10 KHz sampling rate
Wsize = 3; %3 sec
sample_time = 0:1/Fs:Wsize; 
sample_time = sample_time(1:end-1);
%length of samples
Lsample = length(sample_time);
%frames per second 
Fps = 1;
%bits per frame
Bpf = 8; 
%chips per frame 
Cpf = 50; 
%carrier frequency which we use 
Fc = 500;

%set used JTR (Jammer to Transmitter Power Ratio) values
%SNR (Jb/To) values in decibels

%JTR = 0:0.125:15;
JTR = 15:0.125:50

%Jammer bandwidth
Bj = 10;
%total data length
Ldata = Bpf * Fps * Wsize;

%Bit Error Rate Array
BER_NB = zeros(length(JTR),1); %narrow band (NB) BER
BER_DSSS = BER_NB; %narrow band (NB) BER

Nmax = 100; %maximum number of iterations
Nerr = 10; %minimum number of errors

%Monte Carlo loop starts here
%some initial values
%totally Nmax symbols
for k=1:length(JTR)
    for l=1:Nmax 
        %==================================================================
        %    Transmitter
        %==================================================================
        %data is random and generated again and again foreach MC trial
        data = 2*round(rand(Ldata,1))-1;
                
        %blow up the message to the number of samples
        nb_message_t = 1: Lsample;
        Ndata = round(Lsample/Ldata);
        for i = 1:Ldata
            nb_message_t((i-1)*Ndata+1:(i-1)*Ndata+Ndata) = data(i);
        end
        
        %we need a DS-code, we create a random, length Cpf
        Lcode = Cpf;
        PNcode = 2*round(rand(Lcode,1))-1;
        Ltotal_PN_code = Cpf * Fps * Wsize;
        
        %concatenate the PNcode for each frame to one total PNcode
        total_PN_code = 1: Ltotal_PN_code;
        for i = 1:Ltotal_PN_code
            total_PN_code(i) = PNcode(mod(i,Cpf)+1);
        end

        %blow up the total PNcode to the number of samples
        Ncode = round(Lsample/Ltotal_PN_code);
        for i = 1:Ltotal_PN_code
            code_t((i-1)*Ncode+1:(i-1)*Ncode+Ncode) = total_PN_code(i);
        end
        
        %multiply the code signal with the data
        dsss_t = code_t.*nb_message_t;
        %modulation 
        %carrier sine
        carrier = 1 .* sin(2*pi*Fc*sample_time);
        %modulation of the narrowband message
        m_psk = carrier .* nb_message_t;
        %modulation of the dsss message
        dsss_psk = carrier .* dsss_t;

        %======================================================================
        %                       CHANNEL
        %======================================================================

        tx_dsss_signal = dsss_t;
        tx_nb_signal = nb_message_t;
        %jammer
        %the channel mainly consist of the jammer
        %awgn or rayleigh noise/channel is negligibly compared to the noise
        %of the jammer 
        %calculate the jammer cutoff frequency
        Fj = (Bj/2);
        %generate random sequenz (gaussian)
        noise = randn(Lsample,1);
        %use a low passfilter to limit the bandwidth of the jammer
        [b, a] = butter(3, Fj / (Fs * 2), 'low');
        jammer_t = filter(b,a,noise);
        jammer_t = jammer_t(:)';        
        %since the power of the narrowband signal is 1
        %we have to multiply jammer signal to obtain desired JTR
        %SNR of symbol/noise sample is 0 dB.
        %norm the dsss signal to the narrowband signal
        tx_dsss_signal = 2 * tx_dsss_signal;
        Jpower = JTR(k);
        jammer_t = jammer_t/norm(jammer_t) * norm(tx_nb_signal) *10.0^(0.05*Jpower);
        %modulation of the jamming signal
        psk_jammer = carrier.*jammer_t;     
        %adding the jamming signal to the dsss signal an the nb signal
        rx_dsss_signal = tx_dsss_signal + jammer_t;
        rx_nb_signal = tx_nb_signal + jammer_t;
       
        %==================================================================
        %                       RECEIVER 
        %==================================================================
        %narrowband message demodulation
        rx_nb_signal = rx_nb_signal(:);
        %get the mean value over the time of the symbol duration    
        rx_nb_data = 1:Ldata;
        Ndata = round(length(sample_time)/Ldata);
        for i = 1:Ldata
            rx_nb_data(i) = mean(rx_nb_signal((i-1)*Ndata+1:(i-1)*Ndata+Ndata));
        end
        %BPSK
        %hard decisions, converts soft demodulated symbols to sequence of
        %+-1
        d1 = rx_nb_data>=0;
        d2 = rx_nb_data<0;
        rx_nb_data(d1) = 1;
        rx_nb_data(d2) = -1;
        
        %DSSS demodulation
        %Lets use PNcode to decode the received signal
        despreaded_rx_signal = rx_dsss_signal .* code_t;
        despreaded_rx_signal = despreaded_rx_signal(:);
        %get the mean value over the time of the chip duration 
        rx_dsss_data = 1:Ldata;
        Ndata = round(length(sample_time)/Ldata);
        for i = 1:Ldata
            rx_dsss_data(i) = mean(despreaded_rx_signal((i-1)*Ndata+1:(i-1)*Ndata+Ndata));
        end
        
        %hard decisions, converts soft demodulated symbolsto sequence of
        %+-1
        d1 = rx_dsss_data>=0;
        d2 = rx_dsss_data<0;
        rx_dsss_data(d1) = 1;
        rx_dsss_data(d2) = -1;
            
        %BER analysis
        %errors in the current MC run
        %bit errors of dsss message
        bit_errors_dsss = length(find((data-rx_dsss_data(:))~=0));
        %bit errors of the narrowband massage
        bit_errors_nb = length(find((data-rx_nb_data(:))~=0));
                         
        BER_DSSS(k) = BER_DSSS(k) + bit_errors_dsss; %DSSS BER
        BER_NB(k) = BER_NB(k) + bit_errors_nb; %narrowband BER
        
        %lets see what happens. Normspectrum plots the spectral density (the
        %amount of energy present in each frequency band)
        %plot a spectrum @ JTX = 0dB and @ JTX = 15 dB
        if k == 1 && l == 1 || l == 1 && k == length(JTR)
            [fmpsk magmbpsk] = normspectrum(m_psk,Fs);
            [fdssspsk magdsssbpsk] = normspectrum(dsss_psk,Fs);
            [fjammer magjammer] = normspectrum(psk_jammer,Fs);
            figure();
            plot(fmpsk, magmbpsk);
            title(sprintf('Signal spectrum at JTX %.2f dB',JTR(k)));
            hold on;
            plot(fdssspsk,magdsssbpsk, 'r--');
            plot(fjammer,magjammer, 'k--');
            legend('message signal', 'dsss signal', 'jammer signal');
            xlabel('Frequency [Hz]');
            ylabel('Power spectral density');
            xlim([Fc - (60),Fc + (60)]);
            ylim([0 1]);
        end
        
        %we stop MC trials if minimum number of errors is
        %obtained in all systems
        if BER_DSSS(k)>Nerr && BER_NB(k)>Nerr
            break %terminates the innermost loop
        end
              
    end
    %we calculate BER by dividing number of successful trials
    %by their total number
    BER_DSSS(k) = BER_DSSS(k)/Ldata/l; %DSSS BER
    BER_NB(k) = BER_NB(k)/Ldata/l; %narrowband BER
end

%lets see the the BER of the DSSS and the NB signal behaves to the power of
%the jammer
fl = 10;
%make the BER smoother
BER_NB = filter(ones(1,fl)/fl,1,BER_NB);
BER_DSSS = filter(ones(1,fl)/fl,1,BER_DSSS);
%plot BERs
figure();
plot(JTR,[BER_NB BER_DSSS])
xlabel('Jammer to Transmitter Ratio (JTX)[dB]')
ylabel('BER')
axis([0 JTR(length(JTR)) 1e-6 .5])
grid on
legend('BER Narrowband','BER DSSS')
