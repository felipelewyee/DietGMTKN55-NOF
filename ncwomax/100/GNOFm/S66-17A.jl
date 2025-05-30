using DoNOF

mol = """
0 1
N     1.31405    0.05469    0.00000
H     2.34248    0.10593    0.00000
C     0.74723   -1.20850    0.00000
O     1.44995   -2.22159    0.00000
C    -0.69957   -1.23040    0.00000
H    -1.20554   -2.17991    0.00000
C    -1.37797   -0.06398    0.00000
H    -2.45685   -0.01729    0.00000
N    -0.73078    1.13734    0.00000
H    -1.23979    2.00581    0.00000
C     0.65257    1.26895    0.00000
O     1.20421    2.34896    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-17A"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
