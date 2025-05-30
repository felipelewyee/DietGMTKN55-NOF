using DoNOF

mol = """
0 1
H     1.47786    2.02674   -1.47792
H    -0.75909    0.22976    2.93087
C    -1.72654   -1.32635   -0.82886
B     1.13534   -0.46990   -1.18849
H    -2.27669   -2.08301   -0.25893
P     0.03232   -2.02393   -1.17654
O     0.21785    0.30748    2.94675
Cl    2.33560    2.07710    1.36507
Al    0.70755    0.74188    1.04528
P     1.63168    0.91294   -2.34249
B    -1.59995    0.02349   -0.14624
H     0.59008   -0.51657    3.30981
F     0.32777    1.15310   -3.28767
P    -1.41550    1.58846    0.55584
H    -2.18646   -1.23947   -1.82225
P     1.50819   -1.40171    0.37577
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "MB16-43-31"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
