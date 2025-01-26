
# %%
# Import numpy, sympy, and create a display() shim in lieu of IPython
import numpy as np
import sympy as sy
!python -m site
import matplotlib as mpl
import matplotlib.pyplot as plt

try:
    from IPython.display import display, Math, Markdown
except ImportError:
    #if 'display' not in globals():
    def display(*args, **kwargs):
        print(dict(args=args, kwargs=kwargs))

# %%
## Set SymPy to use `\times` as the symbol for multiplication
## in latex expressions
#from sympy.printing.latex import LatexPrinter
#LatexPrinter.set_global_settings(ln_notation=True, mul_symbol="times")


# %%
# A few classes to format output:

class Md(Markdown):
    def __repr__(self):
        #return f"""```md\n{self.data}\n```"""
        return self.data

class Mathtex(Math):
    def __repr__(self):
        return f'$ {self.data} $'
        #return self.data

def display_expr(expr):
    print(expr)
    print(sy.latex(expr))
    print(sy.latex(expr, mul_symbol="times"))
    print(sy.latex(expr, mul_symbol="dot"))
    print(sy.pretty(expr))
    print('')
    print(Mathtex(sy.latex(expr, mul_symbol="times")))
    display(Mathtex(sy.latex(expr, mul_symbol="times")))


# %% [markdown]
# ## Newton's 2nd Law of Motion:
# $$ F=ma $$
# $$ Force = mass \times acceleration $$
#
# References:
# - https://en.wikipedia.org/wiki/Newton%27s_laws_of_motion

# %%
F,m,a = sy.symbols('Force, mass, acceleration')
second_law_of_motion = sy.Eq(F, m*a)

display(Md("### SymPy expression with LaTex and Unicode"))
display_expr(second_law_of_motion)

# %%
display(Md("### Newton's second law w/ SymPy"))
display(str(second_law_of_motion))
display(Mathtex(sy.latex(second_law_of_motion, mul_symbol='times')))

# %% [markdown]
## Derivatives of displacement with respect to time
# - Displacement is the difference between quantities
#   - For example, the displacement of a powered craft
#     is observed to be  
#     - x: `[0 meters, 10m, 20m, 40m]`  when measured at times  
#     - t: `[0 seconds, 1s, 2s, 3s]`
# - https://en.wikipedia.org/wiki/Velocity
# - https://en.wikipedia.org/wiki/Acceleration
# - https://en.wikipedia.org/wiki/Jerk_(physics)
# - https://en.wikipedia.org/wiki/Fourth,_fifth,_and_sixth_derivatives_of_position

# %% [markdown]
### Derivatives of displacement (SymPy)

# %%
x0, x1, t0, t1 = sy.symbols('x0, x1, t0, t1')
#x0, x1, t0, t1 = sy.symbols('x0:2, t0:2')

display(Md("### 0. Displacement "))
display(Md("Units: (miles, feet, meters, nautical miles)"))

import pandas as pd
df = pd.DataFrame(enumerate([0, 10, 20, 40]), columns=['t (seconds)','x (meters)'])
display(df)
df.plot(kind='line')

first_derivative_of_displacement = (x1-x0) / (t1-t0)
velocity = first_derivative_of_displacement  # with respect to time
display(Md("### 1. Velocity (mph, ft/s, km/s, kts)"), velocity)

acceleration = velocity.diff(t0)
display(Md("### 2. Acceleration (m/s^2, ft/s^2)"), acceleration)

jerk1 = acceleration.diff(t0)
jerk2 = velocity.diff(t0, 2)
display(Md("### 3. Jerk (m/s^3)"), jerk1, jerk2)
# assert jerk1 == jerk2, (jerk1, jerk2)

jounce = velocity.diff(t0, 3)
display(Md("### 4. Snap / Jounce (m/s^4)"), jounce)