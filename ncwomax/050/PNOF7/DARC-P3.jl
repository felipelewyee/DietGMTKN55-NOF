using DoNOF

mol = """
0 1
C    -0.31760    0.20241   -1.11990
C     0.51588    1.37783   -0.66639
C     0.51588    1.37783    0.66639
C    -0.31760    0.20241    1.11990
C    -1.36505    0.15995    0.00000
C     0.51355   -1.06494   -0.77373
C     0.51355   -1.06494    0.77373
H    -0.68318    0.23562   -2.14568
H     1.10241    2.01128   -1.32032
H     1.10241    2.01128    1.32032
H    -0.68318    0.23562    2.14568
H    -2.02063    1.03246    0.00000
H    -1.96080   -0.75758    0.00000
H     0.02524   -1.95915   -1.16905
H     1.51694   -1.02047   -1.19943
H     0.02524   -1.95915    1.16905
H     1.51694   -1.02047    1.19943
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DARC-P3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
