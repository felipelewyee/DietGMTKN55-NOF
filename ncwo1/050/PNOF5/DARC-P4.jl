using DoNOF

mol = """
0 1
C     0.00000   -1.11492   -0.21254
C     1.23315   -0.66401    0.57650
C     1.23315    0.66401    0.57650
C     0.00000    1.11492   -0.21254
C     0.00000    0.00000   -1.28513
C    -1.23315   -0.66401    0.57650
C    -1.23315    0.66401    0.57650
H     0.00000   -2.14861   -0.55354
H     1.92132   -1.32975    1.07929
H     1.92132    1.32975    1.07929
H     0.00000    2.14861   -0.55354
H    -0.90030    0.00000   -1.90292
H     0.90030    0.00000   -1.90292
H    -1.92132   -1.32975    1.07929
H    -1.92132    1.32975    1.07929
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DARC-P4"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
