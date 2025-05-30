using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -1.02967    0.12458    0.00000
O     0.26189    0.75626    0.00000
C     1.33422   -0.05844    0.00000
O     2.45667    0.34979    0.00000
H    -1.75566    0.93294    0.00000
H    -1.16920   -0.48628   -0.89451
H    -1.16920   -0.48628    0.89451
H     1.07095   -1.13256    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E30"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
