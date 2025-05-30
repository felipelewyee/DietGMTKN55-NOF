using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
O    -1.74665    3.02528    0.00000
C    -1.14124    1.97669    0.00000
C    -1.68142    0.61295    0.00000
C    -1.68142   -0.61295    0.00000
C    -1.14124   -1.97669    0.00000
O    -1.74665   -3.02528    0.00000
C     0.30988   -1.76263    0.00000
C     1.37154   -1.14968    0.00000
C     2.28248    0.00000    0.00000
O     3.49329    0.00000    0.00000
C     1.37154    1.14968    0.00000
C     0.30988    1.76263    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-carbooxo1"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
