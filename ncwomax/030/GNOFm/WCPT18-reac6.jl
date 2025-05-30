using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.00000    0.47171    0.00000
H    -0.27641    1.52231    0.00000
C    -1.13433   -0.50443    0.00000
H    -0.77670   -1.53419    0.00000
H    -1.77247   -0.36382    0.87634
H    -1.77247   -0.36382   -0.87634
C     1.28795    0.15147    0.00000
H     2.06051    0.90857    0.00000
H     1.61584   -0.88152    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-reac6"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=nothing,do_hfidr=false,do_m_diagnostic=true)
