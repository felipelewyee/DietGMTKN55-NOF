using DoNOF

mol = """
0 1
S    -1.07651    1.55909   -0.16473
N     1.55759    1.52879   -0.00167
N     0.55024   -0.51665    0.07584
C     0.39481    0.81543   -0.01226
H     2.35939    1.14610    0.46702
H     1.43099    2.51920    0.08325
H     1.47821   -0.89064   -0.01024
C    -0.54350   -1.45978   -0.02538
C    -0.00843   -2.87304    0.00783
H    -1.23656   -1.28244    0.79376
H    -1.09795   -1.27089   -0.94300
H     0.49865   -3.08552    0.94699
H    -0.82163   -3.58325   -0.10446
H     0.69447   -3.04923   -0.80394
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-ethylthiourea_180"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
