using DoNOF

mol = """
0 1
N    -0.11116   -0.02552   -0.01731
O    -0.58896    0.46556    1.24340
H     0.90088   -0.04906    0.02794
H    -0.33039    0.73022   -0.65401
H     0.15697    0.47751    1.84465
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-nh2oh_ecl"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
