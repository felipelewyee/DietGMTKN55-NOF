using DoNOF

mol = """
0 1
O     0.14648    1.08867    0.00463
H     1.11902    1.11455   -0.00042
C    -0.22327   -0.27108   -0.00014
H    -1.30953   -0.32036    0.00411
H     0.12999   -0.80181   -0.88950
H     0.13732   -0.80998    0.88132
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-06A"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
