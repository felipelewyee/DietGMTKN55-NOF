using DoNOF

mol = """
0 1
H    -1.95893    1.23117    1.29240
C    -1.06070    1.11529    0.69655
C     0.18777    0.75556    1.24303
C    -1.06070    1.11529   -0.69655
H     2.34976    0.20429    0.00000
P     1.42058    1.27945    0.00000
C     0.18777   -1.39750    0.69647
H     0.37680    0.79493    2.30956
C     0.18777   -1.39750   -0.69647
H    -1.95893    1.23117   -1.29240
C     0.18777    0.75556   -1.24303
H     0.37680    0.79493   -2.30956
H     1.10246   -1.60705   -1.23710
H    -0.72034   -1.63428    1.23515
H     1.10246   -1.60705    1.23710
H    -0.72034   -1.63428   -1.23515
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-08ts"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
