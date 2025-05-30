using DoNOF

mol = """
0 1
C     0.27501    0.07794   -0.16825
C    -1.21476   -0.21186   -0.46086
C    -0.09832    1.45301    0.19032
C    -1.40727    1.24700   -0.04391
H    -1.40600   -0.38346   -1.52408
C     1.38004   -0.65691   -0.21010
H     1.29336   -1.69240   -0.52447
C     2.75021   -0.17108    0.14747
H     2.73756    0.87445    0.45364
H     3.17727   -0.75715    0.96572
H     3.43692   -0.26629   -0.69797
H     0.46989    2.31316    0.51553
H    -2.28675    1.87029    0.02986
C    -1.89044   -1.28477    0.37909
H    -2.97290   -1.26841    0.23746
H    -1.53432   -2.27840    0.10292
H    -1.68183   -1.13180    1.43877
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R48"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
