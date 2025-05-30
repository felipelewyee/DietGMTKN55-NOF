using DoNOF

mol = """
0 1
C     0.83664    1.11486   -0.02909
H     1.48548    1.97969   -0.04539
C     1.38422   -0.16696   -0.00004
H     2.45771   -0.29628    0.00596
C     0.54751   -1.28184    0.02683
H     0.97195   -2.27597    0.05378
C    -0.83664   -1.11500    0.02446
H    -1.48553   -1.97956    0.04960
C    -1.38413    0.16685   -0.00449
H    -2.45762    0.29646   -0.00156
C    -0.54747    1.28175   -0.03112
H    -0.97211    2.27601   -0.04894
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-50A"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
