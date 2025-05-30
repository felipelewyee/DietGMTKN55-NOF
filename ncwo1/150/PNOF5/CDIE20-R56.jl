using DoNOF

mol = """
0 1
C     1.73617   -0.91032   -0.16245
C     0.22944   -1.11053    0.10961
C     2.00328    0.59035    0.09796
C    -0.34227    0.28574   -0.00812
C     0.63603    1.20066   -0.01495
C    -1.76123    0.57553   -0.05227
C    -2.73559   -0.33459    0.00855
H     1.94704   -1.13592   -1.20812
H     2.36416   -1.56182    0.44294
H     0.04361   -1.50626    1.11315
H    -0.22918   -1.81020   -0.59065
H     2.72112    1.01686   -0.60563
H     2.41730    0.76116    1.09841
H     0.46774    2.26898   -0.05362
H    -2.02612    1.62468   -0.13728
H    -2.52390   -1.39177    0.09654
H    -3.77674   -0.04672   -0.02563
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R56"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
