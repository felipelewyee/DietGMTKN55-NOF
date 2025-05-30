using DoNOF

mol = """
0 1
C     0.00000    0.66797   -0.92748
C     0.00000    0.78640    0.58532
C     0.00000   -0.78640    0.58532
C     0.00000   -0.66797   -0.92748
H     0.00000    1.41343   -1.71368
H     0.88816    1.24477    1.02792
H    -0.88816    1.24477    1.02792
H    -0.88816   -1.24477    1.02792
H     0.88816   -1.24477    1.02792
H     0.00000   -1.41343   -1.71368
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-P7"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
