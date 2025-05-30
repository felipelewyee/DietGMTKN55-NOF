using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N    -2.48717    0.17462   -0.12045
H    -1.49361    0.12490   -0.32212
H    -2.79549    1.08837   -0.42344
H    -2.93926   -0.49171   -0.73084
C     0.89015   -0.01501   -0.53702
Cl    1.93048   -0.16982   -1.88141
C     1.63558   -0.13051    0.72804
H     2.72769   -0.13567    0.70796
H     1.25603    0.62911    1.41707
H     1.27559   -1.07429    1.16222
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-2N"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
