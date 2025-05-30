using DoNOF

mol = """
0 1
C     0.02215    0.93221    0.00000
Li   -0.08463   -3.61313    0.00000
H    -0.94088    1.46591    0.00000
H     0.53399    1.36184   -0.87369
H     0.53399    1.36184    0.87369
Li    1.16375   -0.78056    0.00000
Li   -1.22836   -0.72810    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ALK8-li3_me"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
