using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     1.41518    2.86929    0.00000
C     1.41518    1.34617    0.00000
C     0.00893    0.76126    0.00000
C    -0.00893   -0.76126    0.00000
C    -1.41518   -1.34617    0.00000
C    -1.41518   -2.86929    0.00000
H     0.90092    3.25587    0.87966
H     0.90092    3.25587   -0.87966
H     2.42662    3.27249    0.00000
H     1.95591    0.97732    0.87447
H     1.95591    0.97732   -0.87447
H    -0.53420    1.12924   -0.87527
H    -0.53420    1.12924    0.87527
H     0.53420   -1.12924    0.87527
H     0.53420   -1.12924   -0.87527
H    -1.95591   -0.97732   -0.87447
H    -1.95591   -0.97732    0.87447
H    -2.42662   -3.27249    0.00000
H    -0.90092   -3.25587    0.87966
H    -0.90092   -3.25587   -0.87966
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ACONF-H_ttt"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=nothing,do_hfidr=false,do_m_diagnostic=true)
