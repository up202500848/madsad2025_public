# -*- coding: utf-8 -*-
"""
Babylonian roots
"""

def squareRoot(V, x, epsilon=0.00001):

    it = 0
    
    while (abs(x ** 2 - V) >= epsilon):
        x = (x + V / x) / 2
        it += 1
        
    return x

def cubeRoot(V, x, epsilon=0.00001):

    it = 0
    
    while (abs(x ** 3 - V) >= epsilon):
        x = (2 * x + V / x ** 2) / 3
        it += 1
        
    return x

def generalRoot(V, x, k, epsilon=0.00001):

    it = 0
    
    while (abs(x ** k - V) >= epsilon):
        x = ((k-1) * x + V / x ** (k-1)) / k
        it += 1
        
    return x


    
