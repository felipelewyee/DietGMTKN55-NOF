using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
Be    0.00000    0.00000    0.00000
Cl    0.00000    0.00000    1.79984
Cl    0.00000    0.00000   -1.79984
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-becl2"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
