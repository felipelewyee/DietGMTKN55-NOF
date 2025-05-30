using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.00000    0.66241    0.00000
C     0.00000   -0.66241    0.00000
H     0.92199    1.23058    0.00000
H     0.92199   -1.23058    0.00000
H    -0.92199    1.23058    0.00000
H    -0.92199   -1.23058    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-c2h4"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
