using DoNOF

mol = """
0 1
P     0.00000    0.00000    4.19844
C     0.00000    0.00000    5.72356
H     0.00000    0.00000    6.79524
I     0.00000    0.00000    0.43481
C     0.00000    0.00000   -1.66090
C     0.00000    1.20554   -2.34624
C     0.00000    1.19922   -3.73352
C     0.00000    0.00000   -4.42900
C     0.00000   -1.19922   -3.73352
C     0.00000   -1.20554   -2.34624
H     0.00000    2.14258   -1.80580
H     0.00000    2.13972   -4.26946
H     0.00000    0.00000   -5.51126
H     0.00000   -2.13972   -4.26946
H     0.00000   -2.14258   -1.80580
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_PhI"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
