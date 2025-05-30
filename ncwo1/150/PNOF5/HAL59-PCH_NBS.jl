using DoNOF

mol = """
0 1
P     0.00000    0.00000    3.88809
C     0.00000    0.00000    5.41200
H     0.00000    0.00000    6.48354
N     0.00000    0.00000   -1.34449
O     0.00000    2.28431   -1.73260
O     0.00000   -2.28431   -1.73260
C     0.00000   -1.15593   -2.12942
C     0.00000   -0.66188   -3.54605
C     0.00000    0.66188   -3.54605
H     0.00000    1.34796   -4.37865
H     0.00000   -1.34796   -4.37865
C     0.00000    1.15593   -2.12942
Br    0.00000    0.00000    0.47769
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_NBS"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
