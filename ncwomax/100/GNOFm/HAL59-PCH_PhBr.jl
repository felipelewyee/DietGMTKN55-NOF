using DoNOF

mol = """
0 1
P     0.00000    0.00000    4.09012
C     0.00000    0.00000    5.61551
H     0.00000    0.00000    6.68719
Br    0.00000    0.00000    0.45650
C     0.00000    0.00000   -1.43621
C     0.00000    1.20671   -2.11548
C     0.00000    1.19957   -3.50238
C     0.00000    0.00000   -4.19768
C     0.00000   -1.19957   -3.50238
C     0.00000   -1.20671   -2.11548
H     0.00000    2.13899   -1.56743
H     0.00000    2.13973   -4.03868
H     0.00000    0.00000   -5.27981
H     0.00000   -2.13973   -4.03868
H     0.00000   -2.13899   -1.56743
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_PhBr"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
