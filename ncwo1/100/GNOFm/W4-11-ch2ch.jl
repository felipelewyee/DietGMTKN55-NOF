using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 2
C     0.04984    0.72406    0.00000
H    -0.68539    1.51322    0.00000
C     0.04984   -0.58961    0.00000
H     0.96905   -1.16474    0.00000
H    -0.88178   -1.15517    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-ch2ch"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
