'''
pip3 install patool
pip3 install pyunpack
pip3 install openpyxl
brew install rar
'''

import patoolib
import os
from os import listdir
from os.path import isfile, join
from pathlib import Path
from pyunpack import Archive
import openpyxl as xl
import shutil
count = 0
files = listdir('.')
files.sort()
for file in files:	
	if file.lower().endswith(('.rar', '.zip')):
		count = count + 1		
		file_name = Path(file).stem		
		destination_path = './'+file_name+"/"
		# import pdb
		# pdb.set_trace()		
		try:
			if not Path(destination_path).exists():
				os.makedirs(destination_path)
			else:
				shutil.rmtree(destination_path)
				os.makedirs(destination_path)
			Archive(file).extractall(destination_path)			
			if os.path.exists(file):
  				# os.remove(file)
  				pass
		except:
			print("Cannot extract: "+file)
		
print("Unzip Finished, there are "+str(count)+" files")
excel_file_name = './FormChamBai.xlsx'
excel_file_name2 = './FormChamBai2.xlsx'
if not os.path.exists(excel_file_name):
	print(excel_file_name + " does not exist")
	quit()	

workbook = xl.load_workbook(excel_file_name)
worksheets = workbook.worksheets

worksheet_result = workbook['Result']
worksheet_temp = workbook['temp']
new_sheets = []
start_student = 11
count = 0
for file in files:	
	if os.path.isdir(os.path.join('./', file)):		
		new_sheet = workbook.copy_worksheet(worksheet_temp)
		# import pdb
		# pdb.set_trace()
		#new_sheet.title = file if len(file) < 13 else file[0:12]
		new_sheet.title = file
		worksheet_result['B'+str(start_student)] = file 
		worksheet_result['C'+str(start_student)] = '='+"'"+file+"'"+'!C11'
		start_student = start_student + 1		
		count = count + 1		
		print("created sheet name: "+str(count)+" - "+file)

#del worksheet_temp
workbook.save(excel_file_name2)	
workbook.close()
print("done")

