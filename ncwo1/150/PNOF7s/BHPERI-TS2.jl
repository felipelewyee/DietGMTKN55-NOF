using DoNOF

mol = """
0 1
C    -0.12282   -1.09054    1.14065
C     0.17200    0.23302    1.48249
C    -0.12282    1.35550    0.70296
C    -0.12282    1.35550   -0.70296
C     0.17200    0.23302   -1.48249
C    -0.12282   -1.09054   -1.14065
H     0.82454    0.40945    2.34049
H    -0.03332    2.33318    1.17511
H    -0.03332    2.33318   -1.17511
H     0.82454    0.40945   -2.34049
H     0.43031   -1.88603   -1.64115
H    -1.14789   -1.35457   -0.93626
H     0.43031   -1.88603    1.64115
H    -1.14789   -1.35457    0.93626
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-TS2"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
