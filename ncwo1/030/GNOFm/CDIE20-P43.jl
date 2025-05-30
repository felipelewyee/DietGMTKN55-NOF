using DoNOF

mol = """
0 1
C     0.00000    1.09798    0.00000
C     0.00000   -1.09798    0.00000
C    -1.05912    0.00000    0.00000
C     1.05912    0.00000    0.00000
C    -2.37929    0.00000    0.00000
C     2.37929    0.00000    0.00000
H     0.00000    1.73874    0.88448
H     0.00000    1.73874   -0.88448
H     0.00000   -1.73874    0.88448
H     0.00000   -1.73874   -0.88448
H    -2.94415   -0.92349    0.00000
H    -2.94415    0.92349    0.00000
H     2.94415   -0.92349    0.00000
H     2.94415    0.92349    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P43"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
