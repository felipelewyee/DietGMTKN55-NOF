using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
1 1
Li   -0.40901   -1.91404    0.08129
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CHB6-22A"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
