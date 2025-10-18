import os
import math

def getKCount(s):
    count = 0
    # maximum possible n
    max_n = int((2 * s) ** 0.5) + 1
    
    for n in xrange(1, max_n + 1):
        # total offset for first n numbers
        offset = n * (n - 1) // 2
        if offset > s:
            break
        if (s - offset) % n == 0:
            k = (s - offset) // n
            if k > 0:
                count += 1
    return count

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')
    s = int(raw_input().strip())
    result = getKCount(s)
    fptr.write(str(result) + '\n')
    fptr.close()