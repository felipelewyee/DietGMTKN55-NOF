using DoNOF

mol = """
0 1
N    -2.24579   -0.25044    0.03995
C    -2.66711    1.04870    0.09193
N    -1.68238    1.89514    0.08992
C    -0.55735    1.11281    0.03343
C     0.81820    1.47565    0.00732
O     1.31448    2.58934    0.02876
N     1.62982    0.33868   -0.05103
C     1.19556   -0.95700   -0.07919
N     2.13611   -1.90902   -0.17764
N    -0.07007   -1.28865   -0.05084
C    -0.89288   -0.22916    0.00184
H    -2.83613   -1.06956    0.03276
H     3.10126   -1.70813    0.02642
H     1.84611   -2.86363   -0.04353
H    -3.71689    1.30015    0.12975
H     2.62706    0.51513   -0.07986
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-G"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
