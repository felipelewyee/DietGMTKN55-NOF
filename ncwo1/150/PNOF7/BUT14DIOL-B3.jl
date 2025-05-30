using DoNOF

mol = """
0 1
C     1.42882   -0.09706    0.54935
H     0.90373   -0.56068    1.38892
O     1.53745   -1.01025   -0.53282
C     0.74030    1.20995    0.15561
H     0.61518    1.81628    1.05844
H     1.39955    1.76586   -0.51383
C    -0.61564    1.04080   -0.53933
H    -0.47542    0.59421   -1.52515
H    -1.05108    2.02907   -0.70078
H     0.65980   -1.39891   -0.62295
H     2.44555    0.11870    0.87745
C    -1.62883    0.19511    0.21520
H    -1.63208    0.45807    1.27796
H    -2.63085    0.36990   -0.18417
O    -1.27649   -1.18546    0.04308
H    -1.86990   -1.71965    0.57702
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B3"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
