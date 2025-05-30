using DoNOF

mol = """
0 1
C    -5.76120   -0.11225   -0.15921
H    -5.44177   -1.13891   -0.38608
H    -5.27982    0.55994   -0.88330
H    -6.84822   -0.05639   -0.30964
C    -5.39669    0.27714    1.28089
H    -5.72620    1.30497    1.49379
H    -5.93414   -0.38182    1.98249
C    -3.91100    0.19356    1.57129
C    -3.14858    1.25960    1.89938
H    -3.65756    2.22730    1.95845
C    -1.68572    1.25171    2.19288
H    -1.14807    1.91751    1.49862
H    -1.49200    1.64046    3.20564
H    -1.25248    0.24628    2.11705
C    -3.32188   -1.10903    1.47357
N    -2.88072   -2.18593    1.38636
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C2H5CCNCHCH3"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
