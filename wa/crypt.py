# -*- coding: utf-8 -*-
import random

def inv(perm):
    inverse = [0] * len(perm)
    for i, p in enumerate(perm):
        inverse[p] = i
    return inverse

plain = """
Der Wunsch nach Schnee – ein Kindheitstraum
und passiert‘s dann wirklich, glaubt man‘s kaum.
So ging‘s einem Ehepaar vor vielen Jahren,
die zunächst darüber glücklich waren.

Das Haus geschmückt, geputzt, ganz sauber;
jetzt fehlt noch eins zum Weihnachtszauber,
es ist der himmlisch weiße Glanz –
der gewünschte Flockentanz.

Erst kürzlich sind sie umgezogen,
ein Traum hat sie dazu bewogen.
Hier soll die Welt noch friedlich sein;
hier soll’s im Winter auch mal schneien.

Schon Anfang Dezember hat die schöne Pracht –
die ganze Gegend richtig weiß gemacht.
Schau durchs Fenster, die großen Flocken,
da bleiben wir nicht in der Stube hocken.

Das bisschen Schnee sagt unser Bernd,
hat er doch spielend gleich entfernt
und wünscht sich mehr, die ganze Nacht,
weil‘s ihm doch so viel Freude macht.

Und morgens als er durch das Fenster blickt -
ist er vom tiefen Winter recht beglückt
und kann es gar nicht mehr erwarten;
er schippt und fegt sich durch den Garten.

Jetzt kommt der Gehweg auch noch ran;
der richtige Sport für diesen Mann.
Und als sein Werk vom Schneepflug wird zerstört,
ist er noch nicht einmal empört.

Am nächsten Morgen, nicht ohne Schmerzen,
ruft Hilde, mit ihr ist nicht zu scherzen,
es ist die Einfahrt frei zuräumen
und nicht im Bett noch rum zuträumen.

Bernd gehorcht, was soll er auch machen,
das sind ja alles Männersachen.
Und als er fertig ist mit dem Kram,
da drückt ihm fürchterlich der Darm.

In aller Eile ist es vollzogen
und es dauert bis er angezogen,
da kommt der Schneepflug, der Fahrer winkt,
der alles wieder in die Einfahrt bringt.

Hilde meckert aus dem Haus:
Mach dir bloß kein Hobby draus
und Bernd das Missgeschick beteuert,
flucht ganz heimlich: Ist die bescheuert.

Das ist ein Winter ohne Grenzen;
die Kinder können die Schule schwänzen.
Die Anfangsfreude ist für Bernd dahin,
statt Glühwein trinkt er einen dreifachen Gin.

Mit Hilde gibt’s nun reichlich Streit
danach will sie zur Mutter, gar nicht weit.
Und weil sie gar nicht Heim gekommen;
legt sich schlafen, halb benommen.

Die Nacht war schrecklich, bracht den Rest -
jetzt hasst er schon die weiße Pest.
Eben noch still – und nun der Krach;
der Schnee war zu schwer fürs Überdach.

Er geht nach draußen, es ist vereist,
was ihn dann von den Beinen reißt.
Der Schneepflug hält vor seiner Tür;
der freundliche Fahrer steht jetzt hier.

Er möchte ihn um eine Spende bitten,
da hat der Teufel ihn geritten.
Blindlings schlägt er mit dem Besen,
als sei’s ein böser Geist gewesen.

Doch dieser hat sich dann gewehrt
und ihm eine tiefe Ohnmacht just beschert.
Und als er aufwacht, wer weiß schon wann,
da schaut er sich all die netten Leute an;

Den süßen Saft lässt er sich munden -
aber warum hat man ihn ans Bett gebunden.
http://www.google.de/index.html
""".upper()

N = 26
ekey = {'A': 'K',  'B': 'J',  'C': 'W',  'D': 'D',  'E': 'R',  'F': 'B',  'G': 'U',  'H': 'L',  'I': 'Q',  'J': 'C',  'K': 'A',  'L': 'H',  'M': 'T',  'N': 'E',  'O': 'X',  'P': 'G',  'Q': 'O',  'R': 'N',  'S': 'F',  'T': 'M',  'U': 'Y',  'V': 'I',  'W': 'S',  'X': 'P',  'Y': 'Z',  'Z': 'V'}
dkey = {'K': 'A',  'W': 'C',  'J': 'B',  'R': 'E',  'D': 'D',  'U': 'G',  'B': 'F',  'Q': 'I',  'L': 'H',  'A': 'K',  'C': 'J',  'T': 'M',  'H': 'L',  'X': 'O',  'E': 'N',  'O': 'Q',  'G': 'P',  'F': 'S',  'N': 'R',  'Y': 'U',  'M': 'T',  'S': 'W',  'I': 'V',  'Z': 'Y',  'P': 'X',  'V': 'Z'}

chars = [chr(ord('A')+i) for i in range(N)]
#random.shuffle(chars)

cipher = []
for c in plain:
    if c in chars:
        cipher.append(ekey[c])
    else:
        cipher.append(c)

print ''.join(cipher)

pplain = []
for c in cipher:
    if c in chars:
        pplain.append(dkey[c])
    else:
        pplain.append(c)

#print ''.join(pplain)


