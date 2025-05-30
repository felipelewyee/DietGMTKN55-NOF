using DoNOF

mol = """
0 1
C    -0.88787   -0.88787   -0.88787
C     0.00000    0.00000    0.00000
C     0.88787    0.88787   -0.88787
C    -0.88787    0.88787    0.88787
C     0.88787   -0.88787    0.88787
H    -1.53177   -0.28231   -1.53177
H    -0.28231   -1.53177   -1.53177
H    -1.53177   -1.53177   -0.28231
H     0.28231    1.53177   -1.53177
H     1.53177    1.53177   -0.28231
H     1.53177    0.28231   -1.53177
H    -1.53177    1.53177    0.28231
H    -1.53177    0.28231    1.53177
H    -0.28231    1.53177    1.53177
H     1.53177   -1.53177    0.28231
H     1.53177   -0.28231    1.53177
H     0.28231   -1.53177    1.53177
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E45"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
