using DoNOF

mol = """
0 1
H     0.00000    0.00000    1.66665
C     0.00000    0.00000    0.60325
C     0.00000    0.00000   -0.60325
H     0.00000    0.00000   -1.66665
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-c2h2"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
