import hashlib
types = [0, 21, 37, 97]# 1337
#0  21 97 37 
target = '024800ace2ec394e6af68baa46e81dfbea93f0f6730610560c66ee9748d91420'

barr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
for a in range(len(types)):
  for b in range(len(types)):
    for c in range(len(types)):
      for d in range(len(types)):
        for e in range(len(types)):
          for f in range(len(types)):
            for g in range(len(types)):
              for h in range(len(types)):
                for i in range(len(types)):
                  for j in range(len(types)):
                    for k in range(len(types)):
                      barr = [types[a], types[b], types[c], types[d], types[e], types[f], types[g], types[h], types[i], types[j], types[k]]
                      #print(barr)
                      bstring = ''.join(chr(x) for x in barr)
                      salt = 'P4ssw0rdS4lt'

                      result = hashlib.sha256((bstring+salt+bstring).encode()).hexdigest()
                      if(result == target):
                        print("done!", barr)
                      