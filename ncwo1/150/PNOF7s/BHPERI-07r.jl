using DoNOF

mol = """
0 1
P    -0.29584   -1.58652    0.00000
C    -0.08286   -0.32282    1.28602
C    -0.08286   -0.32282   -1.28602
C    -0.08286    0.90939    0.72895
C    -0.08286    0.90939   -0.72895
H     0.99164   -2.19230    0.00000
H    -0.09867   -0.52734    2.34781
H    -0.09867   -0.52734   -2.34781
H    -0.08351    1.83018    1.30241
H    -0.08351    1.83018   -1.30241
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-07r"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
