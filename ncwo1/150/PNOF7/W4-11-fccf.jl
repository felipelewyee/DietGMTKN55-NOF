using DoNOF

mol = """
0 1
F     0.00000    0.00000    1.88046
C     0.00000    0.00000    0.59458
C     0.00000    0.00000   -0.59458
F     0.00000    0.00000   -1.88046
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-fccf"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
