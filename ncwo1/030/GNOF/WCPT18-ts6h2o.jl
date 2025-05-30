using DoNOF

mol = """
0 1
C     0.40054    0.98174    0.00000
H     1.43956    1.30567    0.00000
C    -0.14092    0.61051    1.23633
H    -1.22277    0.56819    1.33793
H    -0.02433   -0.77402    0.80830
H     0.39042    0.88048    2.13929
H    -0.02433   -0.77402   -0.80830
O    -0.14092   -1.70921    0.00000
H     0.68894   -2.19792    0.00000
C    -0.14092    0.61051   -1.23633
H     0.39042    0.88048   -2.13929
H    -1.22277    0.56819   -1.33793
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts6h2o"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
