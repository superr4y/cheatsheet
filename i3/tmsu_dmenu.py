#!/usr/bin/env python2
import subprocess

# get all current tags from virtual file system (tmsu mount /t) and open dmenu to choose tags
all_tags = subprocess.Popen(["find", "/t/tags", "-maxdepth", "1", "-printf", "%f "], stdout=subprocess.PIPE)
tags = subprocess.Popen(["dmenu", "-i", "-p", all_tags.stdout.readline().rstrip()],stdout=subprocess.PIPE, stdin=all_tags.stdout)

choosen_tags = tags.stdout.readline().rstrip()

# query tmsu for files with choosen tags and execute dmenu again to choose one file (of the list)
files = subprocess.Popen(["tmsu", "files", choosen_tags], stdout=subprocess.PIPE)
choosen_file = subprocess.Popen(["dmenu", "-i", "-p", "tmsu:"], stdout=subprocess.PIPE, stdin=files.stdout)

file_name =choosen_file.stdout.readline().rstrip()

# open that file with default application
subprocess.Popen(["xdg-open", file_name])
