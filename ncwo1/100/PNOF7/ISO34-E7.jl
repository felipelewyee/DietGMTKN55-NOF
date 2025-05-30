using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -1.84270   -0.11822    0.00000
C    -0.60989    0.39585    0.00000
C     0.60989   -0.39585    0.00000
C     1.84270    0.11822    0.00000
H    -2.01012   -1.19009    0.00000
H    -2.72188    0.51348    0.00000
H    -0.48338    1.47603    0.00000
H     0.48338   -1.47603    0.00000
H     2.01012    1.19009    0.00000
H     2.72188   -0.51348    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E7"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
