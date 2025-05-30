using DoNOF

mol = """
0 1
C     0.00000    0.18366    0.00000
C     1.35289   -0.31156    0.00000
C     0.38421   -1.20172    0.00000
C    -0.89618    1.16111    0.00000
C    -0.05528   -2.60591    0.00000
C    -0.54378    2.62106    0.00000
H     2.41036   -0.11480    0.00000
H    -1.94692    0.89557    0.00000
H    -0.67687   -2.80203    0.87634
H    -0.67687   -2.80203   -0.87634
H     0.53803    2.76129    0.00000
H    -0.94351    3.13847   -0.87746
H     0.78807   -3.29478    0.00000
H    -0.94351    3.13847    0.87746
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R26"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
