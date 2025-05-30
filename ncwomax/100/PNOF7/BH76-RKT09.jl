using DoNOF

mol = """
0 2
C     1.12509   -0.54110   -0.01267
C     0.13618    0.60269   -0.06564
O    -2.18628   -0.40939   -0.09120
H     0.96852   -1.15581    0.87259
H     1.03334   -1.18092   -0.88926
H     2.14900   -0.16161    0.01900
H     0.13782    1.23071    0.82289
H     0.20027    1.20876   -0.96670
H    -0.96348    0.11308   -0.11661
H    -2.60045    0.29359    0.42761
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT09"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
