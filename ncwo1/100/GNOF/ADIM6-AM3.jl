using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.00000    0.00000    0.61907
C     0.00000    1.26823   -0.22977
C     0.00000   -1.26823   -0.22977
H     0.87710    0.00000    1.27634
H    -0.87710    0.00000    1.27634
H     0.00000    2.16788    0.39248
H    -0.88389    1.30485   -0.87429
H     0.88389    1.30485   -0.87429
H     0.00000   -2.16788    0.39248
H    -0.88389   -1.30485   -0.87429
H     0.88389   -1.30485   -0.87429
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ADIM6-AM3"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
