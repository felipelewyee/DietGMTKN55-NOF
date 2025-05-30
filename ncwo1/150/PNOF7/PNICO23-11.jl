using DoNOF

mol = """
0 1
P     0.11087    1.77509    0.00000
H     1.06895    1.76070    1.04078
H     1.06895    1.76070   -1.04078
C    -0.11087    3.55059    0.00000
N    -0.35587    4.67323    0.00000
P    -0.11087   -1.77509    0.00000
H    -1.06895   -1.76070    1.04078
H    -1.06895   -1.76070   -1.04078
C     0.11087   -3.55059    0.00000
N     0.35587   -4.67323    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-11"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
