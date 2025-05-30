using DoNOF

mol = """
0 1
C    -0.28271   -0.29485    0.00000
O     0.11291    0.95853    0.00000
O     0.43575   -1.28175    0.00000
H    -1.37330   -0.37398    0.00000
H     1.10735    0.99204    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S22-03a"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
