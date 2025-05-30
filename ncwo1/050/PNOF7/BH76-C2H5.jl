using DoNOF

mol = """
0 2
C    -0.02568   -0.62491    0.00000
C    -0.02568    0.86613    0.00000
H     0.99398   -1.02874    0.00000
H    -0.52373   -1.02453    0.88342
H    -0.52373   -1.02453   -0.88342
H     0.05242    1.41829   -0.92432
H     0.05242    1.41829    0.92432
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-C2H5"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
