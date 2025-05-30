using DoNOF

mol = """
0 1
C     0.54982    1.46913    0.00000
N     0.01881    0.04592    0.00000
H     0.08336    1.92801    0.88309
H     0.08336    1.92801   -0.88309
C     0.54982   -0.63341    1.20287
H     0.22431   -1.67428    1.21568
H     1.63125   -0.55013    1.17062
H     0.17428   -0.10884    2.07776
C     0.54982   -0.63341   -1.20287
H     0.22431   -1.67428   -1.21568
H     0.17428   -0.10884   -2.07776
H     1.63125   -0.55013   -1.17062
C    -1.46686   -0.07623    0.00000
H    -1.77559   -1.12478    0.00000
H    -1.83904    0.42866    0.88681
H    -1.83904    0.42866   -0.88681
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nme3-ch2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
