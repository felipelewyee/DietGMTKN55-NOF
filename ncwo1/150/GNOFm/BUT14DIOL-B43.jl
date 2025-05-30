using DoNOF

mol = """
0 1
C     1.25520   -0.41247    0.22715
H     0.76580   -1.26258   -0.23599
O     2.61486   -0.46059   -0.20490
C     0.57977    0.89350   -0.17986
H     1.18095    1.72005    0.21258
H     0.60624    0.97954   -1.26883
C    -0.85681    1.06366    0.32379
H    -1.17504    2.09047    0.12909
H    -0.89842    0.91865    1.40616
H     3.07612    0.26696    0.22099
H     1.18398   -0.54511    1.31185
C    -1.87772    0.14074   -0.32003
H    -2.88591    0.47750   -0.06117
H    -1.77648    0.17970   -1.41004
O    -1.66194   -1.18637    0.16142
H    -2.30321   -1.76209   -0.26308
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B43"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
