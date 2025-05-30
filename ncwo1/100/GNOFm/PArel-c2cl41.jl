using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
1 1
C     0.66671    0.00000    0.37021
C    -0.66671    0.00000    0.37021
Cl    1.65414    0.00000    1.71517
Cl    1.47342    0.00000   -1.20290
Cl   -1.65414    0.00000    1.71517
Cl   -1.47342    0.00000   -1.20290
H     0.00000    0.00000   -1.76495
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-c2cl41"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
