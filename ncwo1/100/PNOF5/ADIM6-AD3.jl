using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.42047    1.88177    0.00000
C    -0.42047    1.99729    1.26823
C    -0.42047    1.99729   -1.26823
H     1.19099    2.66126    0.00000
H     0.95226    0.92339    0.00000
H     0.19599    1.91261    2.16788
H    -1.17929    1.20933    1.30485
H    -0.93872    2.96066    1.30485
H     0.19599    1.91261   -2.16788
H    -1.17929    1.20933   -1.30485
H    -0.93872    2.96066   -1.30485
C    -0.42047   -1.88177    0.00000
C     0.42047   -1.99729   -1.26823
C     0.42047   -1.99729    1.26823
H    -0.95226   -0.92339    0.00000
H    -1.19099   -2.66126    0.00000
H    -0.19599   -1.91261   -2.16788
H     0.93872   -2.96066   -1.30485
H     1.17929   -1.20933   -1.30485
H    -0.19599   -1.91261    2.16788
H     0.93872   -2.96066    1.30485
H     1.17929   -1.20933    1.30485
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ADIM6-AD3"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
