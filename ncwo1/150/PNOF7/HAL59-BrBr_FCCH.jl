using DoNOF

mol = """
0 1
Br    0.00000    0.00000    0.17938
Br    0.00000    0.00000    2.45626
F     0.00000    0.00000   -3.01183
C     0.00000    0.00000   -4.28935
C     0.00000    0.00000   -5.47756
H     0.00000    0.00000   -6.53939
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-BrBr_FCCH"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
