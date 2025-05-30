using DoNOF

mol = """
0 1
Cl    0.00000    1.49399    0.83464
C     0.00000    0.00000   -0.15560
Cl    0.00000   -1.49399    0.83464
H     0.89865    0.00000   -0.75685
H    -0.89865    0.00000   -0.75685
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-97"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
