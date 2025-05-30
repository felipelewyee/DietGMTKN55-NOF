using DoNOF

mol = """
0 1
C     0.00000    0.76785    0.00000
H    -0.82290    1.48699    0.00000
H     1.36780    2.07061    0.00000
H     0.60247   -1.46484    0.00000
N     1.22873    1.06197    0.00000
S    -0.60928   -0.88335    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-reac8"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
