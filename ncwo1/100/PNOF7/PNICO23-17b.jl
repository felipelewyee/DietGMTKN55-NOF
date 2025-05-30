using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
P     0.00000    0.41813    0.00000
F    -0.86459    1.81339    0.00000
H    -0.73537   -0.22007    1.03193
H    -0.73537   -0.22007   -1.03193
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-17b"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
