using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
O    -0.60156   -1.62590    0.00000
O     0.07161   -1.06094    1.09010
O     0.07161   -1.06094   -1.09010
C     0.07161    0.31805    0.77064
C     0.07161    0.31805   -0.77064
H    -0.81519    0.81543    1.16766
H    -0.81519    0.81543   -1.16766
H     0.97276    0.74041    1.20939
H     0.97276    0.74041   -1.20939
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-o3_c2h4_add"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
