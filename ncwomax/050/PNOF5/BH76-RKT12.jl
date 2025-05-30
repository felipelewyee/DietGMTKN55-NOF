using DoNOF

mol = """
0 2
P     0.82623    0.00033   -0.42275
H     0.85541    1.03491    0.54067
H     0.87146   -1.02481    0.55012
H    -0.65762   -0.01071   -0.46212
H    -1.89549    0.00027   -0.20592
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT12"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
