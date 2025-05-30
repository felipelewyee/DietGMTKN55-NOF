using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -0.34179    0.12129    0.00000
O     1.07983    0.19879    0.00000
H     1.43664   -0.69532    0.00000
H    -0.71319    1.14552    0.00000
H    -0.73075   -0.38514   -0.89147
H    -0.73075   -0.38514    0.89147
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E32"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
