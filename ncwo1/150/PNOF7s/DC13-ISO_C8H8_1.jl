using DoNOF

mol = """
0 1
C     0.00000    0.55784    0.00000
C    -1.00395   -0.42012    0.00000
C     1.33227    0.12916    0.00000
C    -0.68403   -1.76833    0.00000
C     1.65535   -1.22192    0.00000
C     0.64758   -2.17748    0.00000
C    -0.28118    1.99902    0.00000
C    -1.47239    2.59658    0.00000
H    -2.04420   -0.12495    0.00000
H     2.12292    0.86914    0.00000
H    -1.47532   -2.50628    0.00000
H     2.69335   -1.52681    0.00000
H     0.89349   -3.23075    0.00000
H     0.60280    2.62906    0.00000
H    -1.55028    3.67453    0.00000
H    -2.40464    2.04759    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-ISO_C8H8_1"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
