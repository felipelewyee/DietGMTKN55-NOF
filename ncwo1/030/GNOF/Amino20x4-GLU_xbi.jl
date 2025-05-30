using DoNOF

mol = """
0 1
N     1.83378    0.42401    0.16100
H     2.14639    1.30386    0.54200
C     0.40689    0.25233    0.05797
H     0.18653   -0.22153   -0.89875
C    -0.09742   -0.64405    1.19910
C    -0.21191    1.64371    0.12425
H     0.12311   -0.14811    2.14504
H     0.48056   -1.56663    1.15364
C    -1.59531   -0.97490    1.14620
O     0.35726    2.55491    0.72442
H    -1.83868   -1.66401    1.95134
H    -2.19171   -0.07260    1.25541
C    -1.93940   -1.60584   -0.17029
O    -1.79067   -2.94041   -0.15110
O    -2.27081   -1.00047   -1.17345
C     2.68722   -0.54333   -0.25552
C     4.15461   -0.22319   -0.11064
O     2.28962   -1.60773   -0.72144
H     4.61663   -0.98676    0.51044
H     4.33748    0.75608    0.32426
H     4.61727   -0.27351   -1.09343
N    -1.40600    1.76043   -0.49027
C    -2.16283    2.99413   -0.47121
H    -1.79212    0.93761   -0.93692
H    -2.30724    3.37509   -1.48027
H    -3.13643    2.84538   -0.00746
H    -1.59753    3.71889    0.10584
H    -1.95238   -3.24355   -1.05809
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "Amino20x4-GLU_xbi"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
