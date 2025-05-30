using DoNOF

mol = """
0 2
C    -0.76595    0.02334    0.00000
C     0.77277    0.03214    0.00000
O     1.16281   -1.27098    0.00000
H    -1.11584    1.05695    0.00000
H    -1.14311   -0.48291    0.88837
H    -1.14311   -0.48291   -0.88837
H     1.11622    0.56218    0.90157
H     1.11622    0.56218   -0.90157
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-2p2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
