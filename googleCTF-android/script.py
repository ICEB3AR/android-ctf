def m0(a, b):
        if (a == 0):
            return [0,1]
        
        r = m0(b % a, a)
        return [r[1] - ((b / a) * r[0]), r[0]]
    

def string_concat(f2):
	result = []
	for i in range(len(f2)/4):
		a = f2[4*i:]
#		print(a)
		result.append((ord(a[3]) << 24) | (ord(a[2]) << 16) | (ord(a[1]) << 8)| (ord(a[0])))
	return result
target = [40999019, 2789358025L, 656272715, 18374979, 3237618335L, 1762529471, 685548119, 382114257, 1436905469, 2126016673, 3318315423L, 797150821]
b = 4294967296
flag = 'CTF{1234567890123456789012345678901234567890123}'
flag_arr = string_concat(flag)
print(flag_arr[0])
print(m0(flag_arr[0],b))

	
