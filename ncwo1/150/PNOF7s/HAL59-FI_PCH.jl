using DoNOF

mol = """
0 1
F     0.00000    0.00000    2.69356
I     0.00000    0.00000    0.76509
P     0.00000    0.00000   -2.41238
C     0.00000    0.00000   -3.93352
H     0.00000    0.00000   -5.00515
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-FI_PCH"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
