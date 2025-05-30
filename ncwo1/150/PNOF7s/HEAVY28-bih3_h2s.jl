using DoNOF

mol = """
0 1
Bi   -0.60394   -1.67154    0.00000
H     0.09993   -2.70669    1.24293
H     0.09993   -2.70669   -1.24293
H     0.86299   -0.69101    0.00000
H    -0.58059    3.50885    0.00000
S    -0.60394    2.17582    0.00000
H     0.72561    2.09125    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-bih3_h2s"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
