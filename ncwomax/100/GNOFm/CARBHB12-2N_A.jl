using DoNOF

mol = """
0 1
N    -0.00000    0.00000    0.28643
H    -0.46959    0.81335   -0.09548
H    -0.46959   -0.81335   -0.09548
H     0.93917    0.00000   -0.09548
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-2N_A"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
