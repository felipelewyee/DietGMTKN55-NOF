using DoNOF

mol = """
0 1
O     1.18470    1.11508   -0.03446
H     0.49391    0.95638    0.63401
H     2.02427    1.08112    0.43014
O    -1.14694    0.06976    1.14702
H    -1.27983   -0.52322    1.89028
H    -1.06414   -0.49567    0.35692
O    -0.16335   -1.02893   -1.24018
H     0.49148   -0.32487   -1.07848
H    -0.54009   -0.84965   -2.10525
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WATER27-H2O3"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
