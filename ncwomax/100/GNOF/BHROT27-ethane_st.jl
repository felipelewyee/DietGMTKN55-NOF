using DoNOF

mol = """
0 1
C     0.00000   -0.00000   -0.75653
C     0.00000    0.00000    0.75653
H     0.87677    0.50620   -1.15187
H    -0.00000   -1.01240   -1.15187
H    -0.87677    0.50620   -1.15187
H    -0.87677   -0.50620    1.15187
H     0.87677   -0.50620    1.15187
H    -0.00000    1.01240    1.15187
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-ethane_st"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
