using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
O     0.00000    0.00000    0.67160
C     0.00000    0.00000   -0.52614
H     0.00000    0.93897   -1.10797
H     0.00000   -0.93897   -1.10797
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-OCH2"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
