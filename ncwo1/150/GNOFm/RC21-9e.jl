using DoNOF

mol = """
1 2
O    -2.41572   -0.15563    0.00000
C    -1.11909   -0.06593    0.00000
C    -0.43652    1.18419    0.00000
C     0.92433    1.18337    0.00000
C     1.63241   -0.04261    0.00000
C     0.95538   -1.27863    0.00000
C    -0.40661   -1.30370    0.00000
H    -2.86175    0.70643    0.00000
H    -1.00479    2.10838    0.00000
H     1.47294    2.11704    0.00000
H     2.71618   -0.02717    0.00000
H     1.52118   -2.20170    0.00000
H    -0.97795   -2.22405    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-9e"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
