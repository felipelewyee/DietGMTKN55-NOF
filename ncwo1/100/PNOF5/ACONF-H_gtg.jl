using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.03378    2.51316    0.68311
C     0.69898    1.82824   -0.50524
C     0.69898    0.30514   -0.40083
C    -0.69898   -0.30514   -0.40083
C    -0.69898   -1.82824   -0.50524
C    -0.03378   -2.51316    0.68311
H     0.50038    2.19975    1.61773
H    -1.02583    2.27158    0.74346
H     0.12105    3.59634    0.61361
H     1.72889    2.17916   -0.59037
H     0.19408    2.12346   -1.42818
H     1.23306    0.01442    0.50682
H     1.26168   -0.11310   -1.24010
H    -1.26168    0.11310   -1.24010
H    -1.23306   -0.01442    0.50682
H    -0.19408   -2.12346   -1.42818
H    -1.72889   -2.17916   -0.59037
H    -0.12105   -3.59634    0.61361
H    -0.50038   -2.19975    1.61773
H     1.02583   -2.27158    0.74346
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ACONF-H_gtg"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
