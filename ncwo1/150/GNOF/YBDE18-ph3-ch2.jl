using DoNOF

mol = """
0 1
C    -0.01533    1.20051    0.00000
P    -0.01533   -0.47795    0.00000
H     0.29462    1.67164    0.92295
H     0.29462    1.67164   -0.92295
H    -0.68590   -1.00383   -1.11082
H    -0.68590   -1.00383    1.11082
H     1.10443   -1.36942    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-ph3-ch2"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
