using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N     0.00000    0.00000   -2.08713
H     0.00000    0.94898   -2.43333
H     0.82184   -0.47449   -2.43333
H    -0.82184   -0.47449   -2.43333
Cl    0.00000    0.00000    0.26104
F     0.00000    0.00000    1.94135
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NH3_FCl"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
