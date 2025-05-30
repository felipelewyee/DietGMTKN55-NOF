using DoNOF

mol = """
0 1
N    -0.00532    2.30875    0.00000
C     0.00072    1.60806    1.13646
C     0.01152    0.21867    1.18778
C     0.01358   -0.51353    0.00000
C     0.01152    0.21867   -1.18778
C     0.00072    1.60806   -1.13646
C    -0.00739   -2.01852    0.00000
H    -0.00014    2.18802    2.05445
H     0.01996   -0.28505    2.14781
H     0.01996   -0.28505   -2.14781
H    -0.00014    2.18802   -2.05445
H     0.48609   -2.42355   -0.88499
H     0.48609   -2.42355    0.88499
H    -1.03717   -2.38900    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-P21"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
