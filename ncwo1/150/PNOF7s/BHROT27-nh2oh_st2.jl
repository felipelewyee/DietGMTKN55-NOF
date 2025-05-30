using DoNOF

mol = """
0 1
N    -0.38962   -0.49757    0.00000
O    -0.37767    0.91541    0.00000
H     0.11415   -0.81334    0.82071
H     0.11415   -0.81334   -0.82071
H     0.53900    1.20884    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-nh2oh_st2"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
