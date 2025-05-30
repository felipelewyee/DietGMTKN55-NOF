using DoNOF

mol = """
0 1
C    -4.26989    1.41275    1.47463
H    -4.72716    1.06442    2.41361
C    -2.77515    1.07540    1.49993
H    -2.29422    1.40781    0.56425
H    -2.28492    1.61892    2.32092
N    -2.50903   -0.33441    1.69919
C    -2.75109   -1.38495    1.15040
O    -2.91069   -2.47661    0.72228
H    -4.74965    0.84590    0.66072
C    -4.51432    2.91184    1.28773
H    -4.05789    3.49745    2.09972
H    -4.09279    3.27246    0.33767
H    -5.58935    3.13664    1.28043
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C3H7NCO"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
