#!/usr/bin/python

import sys 

# Arguments passed 
print ("Converting: '" + sys.argv[1] + "'") 

# It takes the MiFARE RFID and decimalises and removes digits for one and then reverses the number and does the same for the other.

sample = sys.argv[1]
reordered = "".join(list(reversed([sample[i:i+2] for i in range(0, len(sample), 2)])))
decimalA = int(reordered, 16)
decimalB = int(sample, 16)
subset = str(decimalB)[2:]
hashed_subset = "#" + str(decimalB)[2:]

print (sample)
print (reordered)
print (decimalA)
print (decimalB)
print (subset)
print (hashed_subset)
