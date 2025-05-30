using DoNOF

mol = """
0 1
N     0.27661    0.27246    1.55708
C    -0.52042   -0.06911    0.39075
C     0.30388    0.06883   -0.86833
O     1.50707    0.04326   -0.91632
O    -0.47650    0.17996   -1.96849
H     1.22037   -0.08392    1.45617
H    -0.12823   -0.10526    2.40378
H     0.11282    0.20988   -2.73894
H    -0.90531   -1.10288    0.37416
H    -1.39029    0.58680    0.31013
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E42"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
