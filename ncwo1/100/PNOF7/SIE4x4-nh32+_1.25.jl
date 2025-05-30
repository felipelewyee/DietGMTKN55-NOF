using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
1 2
N     0.00000    0.00000   -1.35407
N     0.00000    0.00000    1.35407
H     0.84297    0.48669   -1.62974
H     0.00000   -0.97338   -1.62974
H    -0.84297    0.48669   -1.62974
H     0.84297   -0.48669    1.62974
H     0.00000    0.97338    1.62974
H    -0.84297   -0.48669    1.62974
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "SIE4x4-nh32+_1.25"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
