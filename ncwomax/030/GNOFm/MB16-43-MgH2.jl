using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
Mg    0.00000    0.00000    0.00000
H    -0.00000   -0.00000   -1.70693
H    -0.00000    0.00000    1.70693
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "MB16-43-MgH2"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=nothing,do_hfidr=false,do_m_diagnostic=true)
