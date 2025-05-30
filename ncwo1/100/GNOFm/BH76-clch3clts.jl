using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
-1 1
Cl   -0.00027    0.01924    2.32254
C     0.00021    0.00020   -0.00005
H     0.76098   -0.75102    0.00641
H    -1.03075   -0.28301    0.00218
H     0.27043    1.03464   -0.00866
Cl   -0.00060   -0.02007   -2.32242
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-clch3clts"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
