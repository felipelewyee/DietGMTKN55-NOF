using DoNOF

mol = """
0 1
C    -0.32218    2.39856    0.00279
C    -0.12777    0.98756    0.58601
C    -1.27551    0.05452    0.20981
C    -1.25079   -0.70264   -0.96882
C    -2.32845   -1.52647   -1.30377
C    -3.44325   -1.60595   -0.46218
C    -3.47428   -0.85461    0.71677
C    -2.39571   -0.02962    1.04833
H    -0.38230   -0.65246   -1.62003
H    -2.29573   -2.11003   -2.22199
H    -4.28005   -2.25158   -0.72179
H    -4.33608   -0.91115    1.37917
H    -2.42273    0.56128    1.96224
C     1.25325    0.41613    0.29259
C     1.88538   -0.33959    1.29255
C     3.13505   -0.92231    1.07216
C     3.77753   -0.75512   -0.15963
C     3.15877   -0.00364   -1.16221
C     1.90418    0.57579   -0.94085
H     1.38551   -0.47376    2.25104
H     3.60771   -1.50423    1.86116
H     4.75246   -1.20571   -0.33470
H     3.65044    0.13304   -2.12358
H     1.43449    1.14993   -1.73398
H    -0.18158    1.15017    1.67096
H     0.55106    3.04384    0.17191
F    -0.56423    2.37472   -1.35719
F    -1.41519    3.00332    0.59324
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISOL24-i20e"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
