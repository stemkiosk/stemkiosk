
name = "World;--'\""
print(f"Hello world, {name}!")

# %%
print(1+1)
print('1+1=', 1+1)
print(f'{1+1=}')

assert 1+1 == 2
assert 1+1 == 2, ("1+1 should be 2, but", (1+1))

# %%
assert 1/2 == 0.5
assert 1/3 == 1/3
print(1/3)

from fractions import Fraction
f = Fraction(1,3)
print(f)

assert f.numerator == 1
assert f.denominator == 3

# %%
print(Fraction('1/3'))
print(Fraction(1/3))  # !
assert Fraction('1/3') != Fraction(1/3)

# %%
assert Fraction(1,2) == 0.5 == 1/2
assert Fraction(3,2) == 1.5 == 3/2

assert (Fraction(3,2) + Fraction(1,2)) == Fraction(4,2) == Fraction(2,1) == 2

assert (Fraction(5,3) + Fraction(4,7)) == Fraction(47,21)
assert 7*5 == 35
assert 4*3 == 12
assert (7*5)+(4*3) == 47
assert (3*7) == 21


a = Fraction(5,3)
b = Fraction(4,7)
assert (a.numerator * b.denominator) + (b.numerator * a.denominator) == 47
assert a.denominator * b.denominator == 21
assert a+b == Fraction(47, 21)

# %%
assert 2*2 == 4 == 2**2
assert 2*3 == 6
assert 2*4 == 8 == 2**3
assert 2*5 == 10
assert (2*6 == 12) and (2*7 == 14)
assert 2*8 == 16 == 2**4

# %%
print(('n','2*n', '2**n', 'n*n'))
for n in range(0, 8):
    print((n, 2*n, 2**n, n*n))

import pandas as pd
numbers = list(range(0,8))
df = pd.DataFrame(index=numbers, data=dict(n=numbers))
df['2*n'] = df['n']*2
df['2**n'] = 2**df['n']
df['n*n'] = df['n']*df['n']
print(df)
assert df['2*n'][7] == 14
assert df['2**n'][7] == 128
assert df['n*n'][7] == 49

# %%

data = [[n*m for n in range(0,8)] for m in range(0,8)]
print(data)
df = pd.DataFrame(data=data)
print(df)
assert df[0][0] == 0
assert df[2][3] == 6 == 2*3
assert df[7][7] == 49 == 7*7 == 7**2

# %%
print(f"End of {__file__}")
