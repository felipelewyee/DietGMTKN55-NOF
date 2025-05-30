using DoNOF

mol = """
0 1
C    -1.02508    1.53111   -0.45617
H    -0.90046    1.94228   -1.45522
H    -0.51850    2.17210    0.26161
H    -2.09149    1.50458   -0.23775
C    -0.51308    0.11331   -0.45388
O    -0.97306   -0.75243   -1.19305
N     0.47340   -0.15972    0.43845
H     0.87316    0.59521    0.96381
C     1.06184   -1.47931    0.51595
H     0.27367   -2.22064    0.42293
H     1.78310   -1.65131   -0.28259
H     1.55650   -1.59518    1.47589
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-11B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
