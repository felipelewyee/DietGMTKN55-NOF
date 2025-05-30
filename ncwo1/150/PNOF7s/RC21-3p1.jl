using DoNOF

mol = """
1 1
C     1.23832    0.00000   -0.18227
C     1.22853    0.00000    1.18399
C     0.00000    0.00000    1.85845
C    -1.22853    0.00000    1.18399
C    -1.23832    0.00000   -0.18227
C     0.00000    0.00000   -0.90235
C     0.00000    0.00000   -2.26408
H    -0.92730    0.00000   -2.82867
H     0.92730    0.00000   -2.82867
H     2.16959    0.00000   -0.73742
H     2.15324    0.00000    1.74657
H     0.00000    0.00000    2.94361
H    -2.15324    0.00000    1.74657
H    -2.16959    0.00000   -0.73742
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-3p1"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
