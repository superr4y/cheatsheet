import subprocess

proc = subprocess.Popen(["programm", "arg"],stdout=subprocess.PIPE)
out = proc.stdout.readline().rstrip()
