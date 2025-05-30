using DoNOF

mol = """
0 1
O    -1.85076    3.20562    0.00000
C    -1.25339    2.17094    0.00000
C    -1.21391    0.71460    0.00000
C    -1.21391   -0.71460    0.00000
C    -1.25339   -2.17094    0.00000
O    -1.85076   -3.20562    0.00000
C    -0.01191   -1.40858    0.00000
C     1.22582   -0.69398    0.00000
C     2.50678    0.00000    0.00000
O     3.70153    0.00000    0.00000
C     1.22582    0.69398    0.00000
C    -0.01191    1.40858    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-carbooxo2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
