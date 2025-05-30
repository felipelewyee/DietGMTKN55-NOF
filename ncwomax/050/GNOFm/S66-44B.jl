using DoNOF

mol = """
0 1
C    -2.53269   -0.30050   -0.01437
H    -2.56218   -0.91352   -0.91556
H    -2.56882   -0.97472    0.84125
H    -3.43386    0.31052    0.00288
C    -1.27125    0.55218    0.02145
H    -1.27166    1.17227    0.92084
H    -1.26287    1.23909   -0.82761
C     0.00002   -0.28538   -0.00549
H    -0.00013   -0.97205    0.84634
H     0.00016   -0.91296   -0.90214
C     1.27124    0.55221    0.02191
H     1.27151    1.17202    0.92139
H     1.26305    1.23928   -0.82700
C     2.53269   -0.30052   -0.01391
H     2.56232   -0.91337   -0.91522
H     3.43387    0.31042    0.00366
H     2.56861   -0.97497    0.84159
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-44B"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
