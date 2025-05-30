using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     2.40608   -0.14163    0.10814
C     0.96322   -0.33352   -0.34123
C     0.03678    0.73128    0.23388
C    -1.40381    0.63605   -0.26116
C    -2.10514   -0.65012    0.16053
H     3.06171   -0.90766   -0.30292
H    -1.41327    0.71872   -1.35063
H    -1.96682    1.49079    0.11755
H     2.48072   -0.18561    1.19468
H     2.78478    0.82970   -0.20961
H     0.43943    1.71569   -0.01793
H     0.04789    0.66406    1.32598
H     0.90855   -0.30118   -1.43235
H     0.62070   -1.32514   -0.04290
H    -3.15013   -0.64777   -0.14553
H    -1.63561   -1.52721   -0.28094
H    -2.07508   -0.76644    1.24443
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ACONF-P_TG"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
