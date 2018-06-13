import sys
import os
import subprocess

def iscorrect(logname, source_filename):
	outfile_name = 'sudoku_chk.z3'
	source = open(source_filename, 'r').read().split('\n')
	solution = open(logname,'r').read().split('\n')[1:]
	outfile = open(outfile_name, 'w')
	for line in source:
		if '; Print solution, line by line' in line:
			break
		if ';;;;;; --- END-CONSTRAINTS-DOMAIN ---' not in line:
			outfile.write(line+'\n')
		else:
			outfile.write(line+'\n')
			outfile.write(';; Assert generated solution ;;\n')
			for sol in solution:
				if sol.startswith('(((Board'):
					outfile.write('(assert (= '+sol[2:]+'\n')
			outfile.write(';; End Assert generated solution ;;\n')
	outfile.close()
	result = subprocess.call(["z3", outfile_name])
	os.remove(outfile_name)
	print(result)

def new_solution(logname, source_filename):
	logfile_name = 'sudoku_new.log'
	outfile_name = 'sudoku_new.z3'
	source = open(source_filename, 'r').read().split('\n')
	solution = open(logname,'r').read().split('\n')[1:]
	outfile = open(outfile_name, 'w')

	constraint1b = ['(assert (= (Board x0 y0) 6))', 
					'(assert (= (Board x0 y1) 2))',
					'(assert (= (Board x1 y3) 6))',
					'(assert (= (Board x1 y4) 9))',
					'(assert (= (Board x2 y2) 4))',
					'(assert (= (Board x2 y5) 7))',
					'(assert (= (Board x5 y1) 4))',
					'(assert (= (Board x6 y6) 3))',
					'(assert (= (Board x8 y3) 5))',
					'(assert (= (Board x8 y7) 4))',
					'(assert (= (Board x8 y8) 6))']
	for line in source:
		if ';;;;;; --- END-CONSTRAINTS-DOMAIN ---' not in line:
			outfile.write(line+'\n')
		else:
			outfile.write(line+'\n')
			outfile.write(';; Assert generated solution ;;\n')
			for sol in solution:
				if sol.startswith('(((Board') and '(assert (= '+sol[2:] not in constraint1b:
					outfile.write('(assert (not (= '+sol[2:]+')\n')
			outfile.write(';; End Assert generated solution ;;\n')
	outfile.close()
	logfile = open(logfile_name, 'w')
	result = subprocess.call(["z3", outfile_name], stdout=logfile)
	logfile.close()
	os.remove(outfile_name)
	print result

def main(logname, opt):
	source_filename = 'sudoku.z3'
	if opt == 0 or opt == -1:
		iscorrect(logname, source_filename)
	if opt == 1 or opt == -1:
		new_solution(logname, source_filename)

if __name__ == '__main__':
	# pass log file as 1st argument 
	# 2nd argument = 0 for asserting the solution
	#              = 1 for generating new solution
  	if len(sys.argv[1:]) == 0:
  		print('Five "sudoku.log" file as an argument.')
  	elif len(sys.argv[1:]) == 1:
  		main(sys.argv[1], -1)
  	else:
  		main(sys.argv[1], sys.argv[2])