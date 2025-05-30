using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -0.72910    0.13435   -0.80316
Cl    0.31122   -0.02045   -2.14755
C     0.01633    0.01886    0.46190
H     1.10843    0.01370    0.44182
H    -0.36322    0.77848    1.15093
H    -0.34366   -0.92492    0.89608
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-2N_B"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
