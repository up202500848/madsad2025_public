# -*- coding: utf-8 -*-
"""
GCD - greater common divisor
"""

def gcdNaive(a,b):
    while b>0:
        if a>b:
            a=a-b
        else:
            b=b-a
    return a

def gcdRemainder(a,b):
    while b>0:
        r=a%b
        a=b
        b=r
    return a

def gcdRecursive(a,b):
    if b==0:
        return a
    else:
        return gcdRecursive(b, a % b)


