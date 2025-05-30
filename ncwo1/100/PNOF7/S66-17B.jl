using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N     0.59092    1.16030    0.00000
H     1.03816    2.06687    0.00000
C     1.44697    0.04568    0.00000
O     2.65642    0.19738    0.00000
C     0.73275   -1.21650    0.00000
H     1.29933   -2.13153    0.00000
C    -0.61742   -1.22031    0.00000
H    -1.19438   -2.13328    0.00000
N    -1.35541   -0.06943    0.00000
H    -2.38175   -0.09087    0.00000
C    -0.78264    1.17523    0.00000
O    -1.43296    2.21645    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-17B"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
