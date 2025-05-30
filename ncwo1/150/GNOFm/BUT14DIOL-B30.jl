using DoNOF

mol = """
0 1
C     1.92554   -0.34407    0.38053
H     2.17157   -1.30490   -0.07129
O     2.34813    0.63489   -0.56479
C     0.43173   -0.27590    0.67770
H     0.19566   -1.03080    1.43521
H     0.21179    0.70031    1.12218
C    -0.43280   -0.49086   -0.56218
H    -0.20015   -1.46802   -0.99675
H    -0.18831    0.26143   -1.31189
H     2.18633    1.49929   -0.17659
H     2.49788   -0.25765    1.30924
C    -1.92720   -0.43929   -0.27105
H    -2.48884   -0.62532   -1.18502
H    -2.19956   -1.21901    0.44878
O    -2.36264    0.84011    0.18796
H    -2.05393    0.94532    1.09071
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B30"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
