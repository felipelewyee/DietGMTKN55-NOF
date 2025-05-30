using DoNOF

mol = """
0 1
C    -0.00529    0.20512    0.00276
C    -0.00526   -0.01129    1.49376
O     1.00773    0.41655   -0.62219
N    -1.21642    0.08470   -0.60346
H    -2.06680    0.07428   -0.07915
H    -1.26212    0.28560   -1.58484
H    -0.96835    0.19979    1.95046
H     0.25827   -1.04755    1.69465
H     0.75401    0.61583    1.94253
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-acetamide_RC"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
