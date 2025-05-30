using DoNOF

mol = """
0 1
C     1.87348   -0.51658    0.00753
H     1.86186   -1.18315   -0.85416
O     3.10262    0.19795   -0.08114
C     0.65443    0.39511   -0.02477
H     0.69825    1.07961    0.82873
H     0.70301    1.00775   -0.92758
C    -0.65228   -0.39438    0.01525
H    -0.70097   -1.00120    0.92195
H    -0.70240   -1.08106   -0.83239
H     3.16229    0.76281    0.69390
H     1.84867   -1.14110    0.90687
C    -1.86945    0.50977   -0.02469
H    -1.84651    1.19919    0.82606
H    -1.85595    1.10745   -0.94205
O    -3.02829   -0.31865    0.02505
H    -3.80001    0.25175   -0.01252
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B33"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
