using DoNOF

mol = """
0 1
H    -0.00001    2.48933    0.00000
H    -1.02025   -1.62845    0.00000
H     0.51012   -1.62843    0.88354
H     0.51012   -1.62843   -0.88354
C    -0.00000    1.42642    0.00000
C     0.00000    0.21828    0.00000
C     0.00001   -1.24537    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-propyne"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
