using DoNOF

mol = """
0 1
C     0.00000    0.00000   -0.76368
C     0.00000    0.00000    0.76368
H     1.00875    0.00000   -1.16760
H    -0.50437   -0.87360   -1.16760
H    -0.50437    0.87360   -1.16760
H     1.00875    0.00000    1.16760
H    -0.50437    0.87360    1.16760
H    -0.50437   -0.87360    1.16760
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-ethane_ecl"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
