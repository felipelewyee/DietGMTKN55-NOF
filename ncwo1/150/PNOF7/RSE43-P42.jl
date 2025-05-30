using DoNOF

mol = """
0 2
N    -1.56570    0.14388    0.00000
C    -0.39040   -0.53188    0.00000
C     0.81964    0.22352    0.00000
O     0.87222    1.44896    0.00000
O     1.94410   -0.55665    0.00000
H    -2.44352   -0.32117    0.00000
H    -1.53174    1.15027    0.00000
H    -0.40064   -1.61036    0.00000
H     2.69603    0.05344    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P42"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
