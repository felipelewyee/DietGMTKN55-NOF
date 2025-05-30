using DoNOF

mol = """
1 1
C     0.00000   -0.68707   -0.15562
C     0.00000    0.68707   -0.15562
H    -0.93544    1.24259   -0.16297
H     0.93544    1.24259   -0.16297
H     0.93544   -1.24259   -0.16297
H    -0.93544   -1.24259   -0.16297
H     0.00000    0.00000    0.96313
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-2p3"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
