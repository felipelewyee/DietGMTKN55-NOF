using DoNOF

mol = """
0 1
C     1.87558    0.13074   -0.32056
H     2.88745    0.45704   -0.06280
O     1.65322   -1.20037    0.14991
C     0.86409    1.05557    0.33454
H     0.90830    0.90059    1.41537
H     1.19080    2.08140    0.14888
C    -0.57535    0.90847   -0.16454
H    -0.60599    1.02663   -1.25040
H    -1.18054    1.71427    0.25557
H     2.29637   -1.77323   -0.27545
H     1.77079    0.17895   -1.40993
C    -1.24997   -0.40148    0.20666
H    -0.77921   -1.23878   -0.30747
H    -1.15285   -0.57328    1.28370
O    -2.62520   -0.27570   -0.16548
H    -3.04534   -1.12486   -0.00946
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B40"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
