using DoNOF

mol = """
0 1
C     0.49662    0.94532    0.28307
H     0.99058    1.52182    1.06281
C    -0.70328    1.43279   -0.20667
H    -1.00456    1.17162   -1.21776
H    -1.46634    0.13389    0.12902
H    -1.06756    2.38658    0.15299
H    -0.57955   -1.15630   -0.16364
O    -1.63654   -1.00489    0.02322
H    -1.82712   -1.39048    0.88955
S     1.20543   -0.55604   -0.09357
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts9h2o"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
