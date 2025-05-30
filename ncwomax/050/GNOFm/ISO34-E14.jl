using DoNOF

mol = """
0 1
C     0.00000    0.00000    0.48865
C     0.00000    0.00000   -0.96688
N     0.00000    0.00000   -2.11788
H     0.51196   -0.88674    0.86537
H     0.51196    0.88674    0.86537
H    -1.02392    0.00000    0.86537
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E14"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
