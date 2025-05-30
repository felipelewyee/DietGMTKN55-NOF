using DoNOF

mol = """
1 1
C     0.00000    0.00000   -1.91139
C     1.22146    0.00000   -1.18937
C     1.21938    0.00000    0.16963
C     0.00000    0.00000    0.89372
C    -1.21938    0.00000    0.16963
C    -1.22146    0.00000   -1.18937
N     0.00000    0.00000   -3.23971
H     0.85653    0.00000   -3.76839
H    -0.85653    0.00000   -3.76839
H     2.16225    0.00000   -1.72637
H     2.16851    0.00000    0.68991
C     0.00000    0.00000    2.29043
H    -2.16851    0.00000    0.68991
H    -2.16225    0.00000   -1.72637
O    -1.13676    0.00000    2.92164
O     1.13676    0.00000    2.92164
H    -1.10498    0.00000    3.88643
H     1.10498    0.00000    3.88643
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-aminocoohbz2"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
