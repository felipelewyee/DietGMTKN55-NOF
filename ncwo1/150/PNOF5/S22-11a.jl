using DoNOF

mol = """
0 1
C    -1.20720   -0.69697    0.00000
C    -1.20720    0.69697    0.00000
C     0.00000   -1.39395    0.00000
C     0.00000    1.39395    0.00000
C     1.20720    0.69697    0.00000
C     1.20720   -0.69697    0.00000
H     0.00000   -2.47443    0.00000
H     2.14292   -1.23722    0.00000
H     2.14292    1.23722    0.00000
H     0.00000    2.47443    0.00000
H    -2.14292    1.23722    0.00000
H    -2.14292   -1.23722    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S22-11a"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
