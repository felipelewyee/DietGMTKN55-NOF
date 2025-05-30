using DoNOF

mol = """
0 1
C     0.00000    0.78194    1.31099
C     0.00000   -0.78194    1.31099
C     0.00000    0.73929   -0.21337
C     0.00000   -0.73929   -0.21337
C     0.00000    1.66894   -1.16067
C     0.00000   -1.66894   -1.16067
H     0.88511    1.23833    1.75269
H    -0.88511    1.23833    1.75269
H     0.88511   -1.23833    1.75269
H    -0.88511   -1.23833    1.75269
H     0.00000    2.72313   -0.91715
H     0.00000    1.40376   -2.20992
H     0.00000   -1.40376   -2.20992
H     0.00000   -2.72313   -0.91715
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R43"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
