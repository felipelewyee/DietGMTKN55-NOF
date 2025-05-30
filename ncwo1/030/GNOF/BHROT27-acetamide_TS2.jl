using DoNOF

mol = """
0 1
C     0.04549   -0.00299    1.52267
C    -0.07602    0.25375    0.05813
N    -1.35175   -0.14528   -0.49040
O     0.79473    0.74720   -0.59908
H    -1.75224    0.67271   -0.93575
H    -1.16429   -0.77905   -1.25888
H    -0.71524    0.56821    2.04876
H    -0.16715   -1.04897    1.73145
H     1.03106    0.27578    1.87625
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-acetamide_TS2"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
