#!/usr/bin/python

import sys 
from flask import Flask, json

api = Flask(__name__)

@api.route('/convert/<code>', methods=['GET'])
def get_companies(code):
  return convert_as_json(code)

# It takes the MiFARE RFID and decimalises and removes digits for one and then reverses the number and does the same for the other.
def convert_as_json(code):
	sample = code
	reordered = "".join(list(reversed([sample[i:i+2] for i in range(0, len(sample), 2)])))
	decimalA = int(reordered, 16)
	decimalB = int(sample, 16)
	subset = str(decimalB)[2:]
	hashed_subset = "#" + str(decimalB)[2:]

	return { 
		"A": sample, 
		"B": reordered,
		"C": decimalA,
		"D": decimalB,
		"E": subset,
		"F": hashed_subset
	}

if __name__ == '__main__':
    api.run()
