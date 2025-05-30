using DoNOF

mol = """
0 1
P     0.05498    1.19949    0.00000
H    -0.38580    2.54990    0.00000
H    -0.82430    0.80483    1.03574
H    -0.82430    0.80483   -1.03574
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-16b"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
