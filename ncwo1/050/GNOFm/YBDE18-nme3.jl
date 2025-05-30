using DoNOF

mol = """
0 1
N     0.00000    0.00000    0.40681
C     0.00000    1.37311   -0.06554
H     0.00000    1.43156   -1.16702
H    -0.88452    1.88977    0.30552
H     0.88452    1.88977    0.30552
C    -1.18915   -0.68656   -0.06554
H    -1.23977   -0.71578   -1.16702
H    -1.19433   -1.71090    0.30552
H    -2.07885   -0.17887    0.30552
C     1.18915   -0.68656   -0.06554
H     1.23977   -0.71578   -1.16702
H     2.07885   -0.17887    0.30552
H     1.19433   -1.71090    0.30552
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nme3"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
