
# ex.1
v = sum(map(lambda i: (2*i+1)/(i**2+2), range(1,101)))

# ex.2
def gcd(a,b):
    return (a if b==0 else gcd(b,a%b)); 

# ex.3
def magic(l):
    # validate its a square matrix
    side = len(l)
    for row in l:
        if len(row) != side:
            return False

    # rows
    total = 0
    first = True
    for row in l:
        temp_tot = 0
        for element in row:
            temp_tot += element
        if first:
            first = False
            total = temp_tot
        else:
            if temp_tot != total:
                return False

    # cols
    for col in range(0,side):
        temp_tot = 0
        for row in l:
            temp_tot += row[col]
        if temp_tot != total:
            return False

    # diagonals
    temp_tot_1 = 0
    temp_tot_2 = 0
    for i in range(0,side):
        #
        #  ! x ! . ! . !
        #  ! . ! x ! . !
        #  ! . ! . ! x !
        #
        temp_tot_1 += l[i][i]
        #
        #  ! . ! . ! x !
        #  ! . ! x ! . !
        #  ! x ! . ! . !
        #
        temp_tot_2 += l[i][side-i-1]
    if temp_tot_1 != total or temp_tot_2 != total:
        return False
    
    return True

######################################################################
# test matrixes
######################################################################

# Not all rows have same sum
not_magic_3x3 = [
    [8, 1, 6],
    [3, 5, 7],
    [4, 9, 3]  # changed last element
]

# Not square
not_square = [
    [1, 2, 3],
    [4, 5, 6]
]

# 3x3 Magic Square
magic_3x3 = [
    [8, 1, 6],
    [3, 5, 7],
    [4, 9, 2]
]

# 4x4 Magic Square
magic_4x4 = [
    [16, 2, 3, 13],
    [5, 11, 10, 8],
    [9, 7, 6, 12],
    [4, 14, 15, 1]
]

# Diagonals don't match
bad_diagonals = [
    [2, 7, 6],
    [9, 5, 1],
    [4, 3, 9]  
]

##############################################
# copilot solutions!
# beautiful of course
##############################################

def magic2(matrix):
    # Check if it's a square matrix
    side = len(matrix)
    if any(len(row) != side for row in matrix):
        return False

    # Calculate the target sum from the first row
    target_sum = sum(matrix[0])

    # Check row sums
    if any(sum(row) != target_sum for row in matrix):
        return False

    # Check column sums
    for col in range(side):
        if sum(matrix[row][col] for row in range(side)) != target_sum:
            return False

    # Check diagonals
    if sum(matrix[i][i] for i in range(side)) != target_sum:
        return False
    if sum(matrix[i][side - 1 - i] for i in range(side)) != target_sum:
        return False

    return True

print(magic(magic_3x3))       # True
print(magic(magic_4x4))       # True
print(magic(not_magic_3x3))   # False
print(magic(not_square))      # False
print(magic(bad_diagonals))   # False


print(magic2(magic_3x3))       # True
print(magic2(magic_4x4))       # True
print(magic2(not_magic_3x3))   # False
print(magic2(not_square))      # False
print(magic2(bad_diagonals))   # False
