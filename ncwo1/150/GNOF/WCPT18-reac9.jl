using DoNOF

mol = """
0 1
C     0.00000    0.75904    0.00000
H    -0.78117    1.50972    0.00000
C     1.28038    1.11266    0.00000
H     2.08452    0.38885    0.00000
H     1.55567    2.15800    0.00000
H     0.46855   -1.54175    0.00000
S    -0.68812   -0.85906    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-reac9"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
