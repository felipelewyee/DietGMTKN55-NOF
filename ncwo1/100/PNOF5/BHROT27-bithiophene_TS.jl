using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -1.44528   -0.89458   -0.65304
C    -2.82869   -0.89088   -0.36843
C    -3.13751   -0.10633    0.69814
S    -1.75271    0.62751    1.36003
C    -0.71937   -0.11625    0.20252
C     0.71937    0.11625    0.20252
S     1.75271   -0.62751    1.36003
C     3.13751    0.10633    0.69814
C     2.82869    0.89088   -0.36843
C     1.44528    0.89458   -0.65304
H    -0.98731   -1.45931   -1.44710
H    -3.55953   -1.45216   -0.92499
H    -4.10325    0.07460    1.13287
H     4.10325   -0.07460    1.13287
H     3.55953    1.45216   -0.92499
H     0.98731    1.45931   -1.44710
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-bithiophene_TS"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
