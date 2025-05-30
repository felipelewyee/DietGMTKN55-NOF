using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N    -0.15681    0.58167   -0.69646
H     0.54378    0.32871   -1.38517
H    -1.04835    0.29422   -1.07799
C     0.10739   -0.16699    0.53124
H    -0.64425    0.08157    1.27840
H     0.12488   -1.25499    0.41729
H     1.07336    0.13581    0.93269
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-11A"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
