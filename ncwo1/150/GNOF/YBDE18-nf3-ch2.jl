using DoNOF

mol = """
0 1
C     0.47920    1.40982    0.00000
N     0.14500    0.14733    0.00000
H     0.44234    1.89494    0.95815
H     0.44234    1.89494   -0.95815
F     0.47920   -0.56755   -1.10366
F    -1.48895   -0.34047    0.00000
F     0.47920   -0.56755    1.10366
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nf3-ch2"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
