using DoNOF

mol = """
0 1
B     1.10737    0.35880   -0.00001
N    -0.01450    1.20282   -0.00000
B     0.00075    2.60281    0.00000
N     1.36882    3.10580    0.00001
B     2.55329    2.25336    0.00000
N     2.45544    0.79218   -0.00001
B    -1.15360    0.38302   -0.00000
N    -2.48858    0.84420    0.00000
B    -2.55738    2.30660   -0.00000
N    -1.35493    3.13514    0.00000
N     0.65652   -0.98205   -0.00001
N    -0.73312   -0.97661   -0.00001
B     1.48928   -2.10532   -0.00000
N     2.89571   -1.69475    0.00000
B     3.38904   -0.32843   -0.00000
B    -1.57639   -2.09566   -0.00000
B    -0.63608   -3.54773    0.00000
N     0.79734   -3.38778    0.00000
B    -3.44551   -0.26132    0.00000
N    -2.97166   -1.63023    0.00000
H    -3.69828   -2.32829    0.00001
H    -4.61766   -0.04687    0.00000
H    -3.61398    2.85638   -0.00001
H    -1.52703    4.12791   -0.00000
H     1.56054    4.09495    0.00001
H     3.62110    2.78088    0.00000
H     4.56548   -0.14291    0.00000
H     3.61304   -2.40246    0.00001
H     1.34393   -4.23689    0.00001
H    -1.02897   -4.67753    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "INV24-BN_Corannulene_TS"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
