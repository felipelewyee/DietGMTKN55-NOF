using DoNOF

mol = """
0 1
S     0.00000    0.00000    0.66725
C     0.00000    1.36148   -0.51768
C     0.00000   -1.36148   -0.51768
H    -0.89163    1.32617   -1.14153
H     0.89163    1.32617   -1.14153
H     0.00000    2.28856    0.05115
H    -0.89163   -1.32617   -1.14153
H     0.00000   -2.28856    0.05115
H     0.89163   -1.32617   -1.14153
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-me2s"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
