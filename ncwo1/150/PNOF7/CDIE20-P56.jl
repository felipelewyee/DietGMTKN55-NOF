using DoNOF

mol = """
0 1
C    -0.35982    0.00936    0.33964
C     0.56766   -1.17725   -0.04274
C     2.00820   -0.62507    0.01819
C     0.53109    1.20600    0.07142
C     1.80172    0.86242   -0.10219
C    -1.64875    0.02367   -0.42336
C    -2.85945   -0.01913    0.11617
H    -0.59852   -0.02518    1.40903
H     0.34041   -1.48220   -1.06550
H     0.40824   -2.04338    0.59679
H     2.64570   -1.03263   -0.76843
H     2.49657   -0.86625    0.96830
H     0.14718    2.21678    0.06921
H     2.61446    1.55689   -0.26625
H    -1.54681    0.07218   -1.50440
H    -2.99694   -0.06785    1.18985
H    -3.75414   -0.00837   -0.49134
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P56"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
