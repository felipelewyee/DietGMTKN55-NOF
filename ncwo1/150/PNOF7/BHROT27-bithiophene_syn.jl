using DoNOF

mol = """
0 1
C    -1.55094   -0.30468    0.79742
C    -2.91736   -0.25726    0.45208
C    -3.11539    0.05007   -0.85765
S    -1.63972    0.30011   -1.67050
C    -0.72168   -0.02541   -0.25416
C     0.72168    0.02541   -0.25416
S     1.63972   -0.30011   -1.67050
C     3.11539   -0.05007   -0.85765
C     2.91736    0.25726    0.45208
C     1.55094    0.30468    0.79742
H    -1.18223   -0.55885    1.77675
H    -3.71977   -0.45315    1.14275
H    -4.04571    0.14360   -1.38587
H     4.04571   -0.14360   -1.38587
H     3.71977    0.45315    1.14275
H     1.18223    0.55885    1.77675
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-bithiophene_syn"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
