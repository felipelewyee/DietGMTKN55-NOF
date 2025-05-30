using DoNOF

mol = """
0 1
C    -1.26983   -0.38590    0.25763
H    -1.22761   -0.48056    1.34342
O    -2.66066   -0.36113   -0.06557
C    -0.56748    0.89921   -0.17128
H    -0.57187    0.96663   -1.26419
H    -1.16749    1.73355    0.19699
C     0.86998    1.04882    0.33665
H     0.89750    0.90033    1.42163
H     1.19910    2.07679    0.16199
H    -2.73130   -0.41193   -1.02228
H    -0.78129   -1.26026   -0.17103
C     1.89166    0.12775   -0.32030
H     1.81821    0.20617   -1.40517
H     2.90205    0.43663   -0.03551
O     1.69649   -1.25571   -0.02914
H     1.83009   -1.37188    0.91569
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B44"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
