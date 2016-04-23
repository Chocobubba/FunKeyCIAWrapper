import os
import csv
import sys
import shutil
import argparse


parser = argparse.ArgumentParser()
parser.add_argument('-titles', action='store', dest='title_list')
arguments = parser.parse_args()

BASEDIR = os.getcwd()

print ("Testing for target folder...")
if (not(os.path.isdir(BASEDIR + "/Tickets"))):
	os.makedirs(BASEDIR + "/Tickets")
	print ("Creating directory "'Tickets'"")
else:
	print ("Directory already exists")


print ("Processing "'input.csv'"...")

f = open("input.csv")
csv_f = csv.reader(f)

for row in csv_f:
	print ("Building Ticket for " + row[2])
	os.system("python FunKeyCIA.py -ticketsonly -title " + row[0] + " -key " + row[1])
	print(BASEDIR + "/Tickets/" + row[0] + "/" + row[0] + ".tik", BASEDIR + "/Tickets/" + row[2] + ".tik")
	print ("")
	
	

print ("Processing complete!")
raw_input("Press ENTER to exit...")
os.exit(0)
