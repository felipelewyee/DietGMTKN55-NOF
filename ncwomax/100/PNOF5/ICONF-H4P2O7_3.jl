using DoNOF

mol = """
0 1
O    -1.32405    0.96469    0.88212
P    -1.55404   -0.15340   -0.27984
O    -2.69238    0.07912   -1.16403
O    -0.08728    0.00668   -0.98547
P     1.28123   -0.22023   -0.14435
O     1.16223   -1.35332    0.79483
O     2.40489   -0.41354   -1.23510
O     1.61458    1.21802    0.45657
O    -1.50368   -1.56348    0.42587
H    -2.16110    1.23977    1.29162
H     2.57955    0.37781   -1.77306
H     0.85844    1.56330    0.97097
H    -0.57839   -1.74541    0.75987
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ICONF-H4P2O7_3"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
