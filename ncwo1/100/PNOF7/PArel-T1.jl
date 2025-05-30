using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
1 1
N    -0.42446    1.90404    0.00000
N     1.57278    0.74848    0.00000
C    -0.47292   -0.47295    0.00000
C     0.93391   -0.42343    0.00000
C    -1.09343    0.74309    0.00000
C     0.95939    2.00784    0.00000
C    -1.21044   -1.77768    0.00000
O     1.71319   -1.45672    0.00000
O     1.56388    3.02801    0.00000
H    -0.92832    2.78393    0.00000
H     2.59099    0.75873    0.00000
H    -2.17423    0.82029    0.00000
H    -0.99425   -2.37534   -0.88874
H    -0.99425   -2.37534    0.88874
H    -2.28648   -1.61069    0.00000
H     1.24466   -2.30228    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-T1"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
