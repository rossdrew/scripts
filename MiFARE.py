#!/usr/bin/python

import sys 

# Arguments passed 
print ("Converting: '" + sys.argv[1] + "'") 

def convert(code):
	'''
	Take the MiFARE RFID and decimalises and removes digits for one and then reverses the number and does the same for the other.

	Returns array consisting of [
			 original code, 
			 octet reversed code, 
			 code converted to decimal, 
			 reversed code converted to decimal, 
			 digital reversed code minus first two digits, 
			 digital reversed code minus first two digits & prefixed with #
		]
	'''
	reordered = "".join(list(reversed([code[i:i+2] for i in range(0, len(code), 2)])))
	decimalA = int(reordered, 16)
	decimalB = int(code, 16)
	subset = str(decimalB)[2:]
	hashed_subset = "#" + str(decimalB)[2:]

	return code, reordered, decimalA, decimalB, subset, hashed_subset

a,b,c,d,e,f = convert(sys.argv[1])

print ("A: " + str(a))
print ("B: " + str(b))
print ("C: " + str(c))
print ("D: " + str(d))
print ("E: " + str(e))
print ("F: " + str(f))
