using DoNOF

mol = """
0 2
N    -0.92592   -0.19601   -0.21712
O     1.40409   -0.24477   -0.12485
H    -1.07828   -0.69972    0.65201
H    -1.11401    0.78373   -0.02271
H     0.19421   -0.30591   -0.46775
H     1.51991    0.66268    0.18043
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT07"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
