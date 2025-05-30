using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N     0.00000    0.00000   -1.14543
N     0.00000    0.00000   -0.01934
O     0.00000    0.00000    1.16477
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13r_1"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=nothing,do_hfidr=false,do_m_diagnostic=true)
