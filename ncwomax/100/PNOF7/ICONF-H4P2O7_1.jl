using DoNOF

mol = """
0 1
O    -2.53820   -0.08772   -1.02724
P    -1.35942   -0.07970    0.02969
O    -1.27738   -1.25286    0.93417
O     0.00000    0.00000   -0.87884
P     1.35942    0.07970    0.02969
O     1.27738    1.25286    0.93417
O     1.49416   -1.36283    0.64971
O     2.53820    0.08772   -1.02724
O    -1.49416    1.36283    0.64971
H    -2.91545   -0.97874   -1.12334
H     0.59640   -1.64077    0.97643
H     2.91545    0.97874   -1.12334
H    -0.59640    1.64077    0.97643
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ICONF-H4P2O7_1"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
