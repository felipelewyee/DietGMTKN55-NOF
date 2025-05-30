using DoNOF

mol = """
1 2
O    -0.30671    2.64512    0.00000
C    -0.63184    1.56798    0.00000
C    -1.04096    0.26155    0.00000
H    -2.11947    0.12171    0.00000
C    -0.14087   -0.80470    0.00000
H    -0.58772   -1.79369    0.00000
C     1.23331   -0.69025    0.00000
H     1.74032    0.26988    0.00000
H     1.85394   -1.57759    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-7p1"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
