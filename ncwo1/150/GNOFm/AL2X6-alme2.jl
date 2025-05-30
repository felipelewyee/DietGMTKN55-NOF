using DoNOF

mol = """
0 1
C     0.00000    1.73001   -0.24261
Al    0.00000    0.00000    0.69739
C     0.00000   -1.73001   -0.24261
H     0.00000    0.00000    2.28536
H     0.00000    1.63396   -1.32844
H     0.87344    2.32376    0.03984
H    -0.87344    2.32376    0.03984
H    -0.87344   -2.32376    0.03984
H     0.87344   -2.32376    0.03984
H     0.00000   -1.63396   -1.32844
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AL2X6-alme2"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
