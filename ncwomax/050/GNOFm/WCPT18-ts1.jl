using DoNOF

mol = """
0 1
C     0.00000    0.00000    0.48976
H     0.00000    0.00000    1.57678
H     0.00000    0.00000   -1.01893
O     0.00000    1.04748   -0.21852
O     0.00000   -1.04748   -0.21852
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts1"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
