using DoNOF

mol = """
0 1
N    -0.36072   -1.55111    0.25686
C    -1.29319   -0.59048    0.33071
H    -2.29598   -0.92143    0.57291
C    -1.03119    0.76059    0.12133
H    -1.82975    1.48510    0.19961
C     0.26824    1.14983   -0.18893
H     0.51022    2.18883   -0.36481
C     1.24779    0.16694   -0.27230
H     2.27010    0.41368   -0.52073
C     0.88532   -1.15820   -0.03910
H     1.62918   -1.94376   -0.09555
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-25B"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
