using DoNOF

mol = """
0 1
C    -2.58667   -0.67281    0.00000
C    -1.09797   -0.74017    0.00000
C    -0.29066    0.35557    0.00000
C     1.15087    0.25226    0.00000
C     1.93042    1.53735    0.00000
O    -0.62363   -1.98133    0.00000
N     1.70437   -0.91870    0.00000
H    -2.93326    0.35564    0.00000
H    -2.97639   -1.18498    0.87751
H    -2.97639   -1.18498   -0.87751
H     0.37683   -1.89601    0.00000
H    -0.74624    1.33272    0.00000
H     2.71732   -0.86233    0.00000
H     1.67722    2.12739    0.88018
H     1.67722    2.12739   -0.88018
H     3.00106    1.34943    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-3a"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
