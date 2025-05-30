using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N     0.00000    0.00000    0.11034
H     0.00000    0.94108   -0.25746
H    -0.81500   -0.47054   -0.25746
H     0.81500   -0.47054   -0.25746
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NH3"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
