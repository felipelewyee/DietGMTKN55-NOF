using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
1 1
C     0.00000   -0.70865    0.09965
C     0.00000    0.70865    0.09965
Cl   -1.44591   -1.57043    0.21086
Cl    1.44591   -1.57043    0.21086
Cl   -1.44591    1.57043    0.21086
Cl    1.44591    1.57043    0.21086
H     0.00000    0.00000   -1.04274
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-c2cl43"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
