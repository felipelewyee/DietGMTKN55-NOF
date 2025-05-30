using DoNOF

mol = """
0 1
S     0.66678    2.05437    0.14978
N    -1.62081    0.80292   -0.02555
N     0.24496   -0.52425   -0.47133
C    -0.28034    0.75225   -0.12049
H    -2.18417   -0.02033   -0.11686
H    -2.05473    1.65771    0.26622
H    -0.02819   -0.76360   -1.41523
C    -0.07867   -1.59928    0.45900
C     0.51260   -2.90921   -0.01006
H     0.34555   -1.32171    1.42180
H    -1.15769   -1.73008    0.61659
H     1.59476   -2.85060   -0.07181
H     0.24448   -3.70871    0.67443
H     0.12765   -3.17768   -0.99300
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-ethylthiourea_TS2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
