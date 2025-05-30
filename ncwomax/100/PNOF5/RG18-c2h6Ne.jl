using DoNOF

mol = """
0 1
C     0.76326    0.00000   -0.39982
C    -0.76326    0.00000   -0.39982
H     1.15784    1.01693   -0.39977
H     1.15784   -0.50851    0.48084
H     1.15784   -0.50842   -1.28054
H    -1.15784   -1.01693   -0.39977
H    -1.15784    0.50851    0.48084
H    -1.15784    0.50842   -1.28054
Ne    0.00000   -0.00000    3.19858
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-c2h6Ne"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
