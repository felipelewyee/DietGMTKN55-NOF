using DoNOF

mol = """
0 1
C    -0.14993   -1.03667    0.00000
S     0.56895    0.42435    0.00000
F    -0.14993    1.30952    1.14455
F    -0.14993    1.30952   -1.14455
B    -1.67880   -1.20107    0.00000
H    -2.12504   -2.30211    0.00000
H    -2.39601   -0.25260    0.00000
B     0.93943   -2.10606    0.00000
H     0.61945   -3.25030    0.00000
H     2.09346   -1.80033    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-f2s-cbh22"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
