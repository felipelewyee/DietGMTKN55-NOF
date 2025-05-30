using DoNOF

mol = """
0 1
C     0.00000    0.79594    0.00000
H    -0.54082    1.73735    0.00000
H     1.89524    1.49402    0.00000
H     0.96489   -0.68563    0.00000
N     1.28962    0.67636    0.00000
S    -0.70917   -0.75349    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts8"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
