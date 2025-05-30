using DoNOF

mol = """
0 1
C    -1.88046    0.00111    0.32863
C    -0.56272    0.00891   -0.42566
N     0.56176    0.02419    0.34436
O    -0.51565    0.00895   -1.64564
H     0.47061   -0.03031    1.34432
C     1.89173   -0.00185   -0.24176
H    -2.46763    0.86512    0.01476
H    -1.76695    0.02378    1.41377
H    -2.43852   -0.89340    0.04804
H     1.93887    0.69761   -1.07586
H     2.14970   -0.99538   -0.61943
H     2.61928    0.29126    0.51448
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E16"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
