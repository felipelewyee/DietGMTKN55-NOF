using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N     0.00000    0.00000    0.28518
H    -0.46975    0.81363   -0.09506
H    -0.46975   -0.81363   -0.09506
H     0.93950    0.00000   -0.09506
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-11"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
