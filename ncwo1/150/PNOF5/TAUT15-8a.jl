using DoNOF

mol = """
0 1
C    -0.80917   -1.62615    0.00000
N    -1.65789   -0.56511    0.00000
C    -0.88945    0.57267    0.00000
C     0.41455    0.13830    0.00000
N     0.44946   -1.23758    0.00000
C     1.66394    0.94877    0.00000
H    -2.66094   -0.60659    0.00000
H    -1.32086    1.55680    0.00000
H    -1.15681   -2.64428    0.00000
H     2.26594    0.72556    0.87831
H     2.26594    0.72556   -0.87831
H     1.43529    2.01205    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-8a"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
