using DoNOF

mol = """
0 1
N     0.32109   -1.23241    0.28126
H     0.57576   -2.18447    0.50718
C    -1.05369   -0.96140    0.21689
O    -1.86829   -1.84398    0.42431
C    -1.35136    0.42344   -0.10503
H    -2.38100    0.72793   -0.17870
C    -0.34275    1.29524   -0.30770
H    -0.51308    2.33392   -0.54876
N     0.97099    0.91827   -0.21576
H     1.71505    1.58116   -0.35663
C     1.37962   -0.36826    0.09365
O     2.54766   -0.68944    0.18929
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-42A"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
