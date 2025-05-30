using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N     0.87376   -2.11828    0.00000
H     0.20945   -2.88073    0.00000
H     1.46313   -2.22182    0.81507
H     1.46313   -2.22182   -0.81507
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-17a"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
