using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -0.00035   -3.76389    0.00000
I     0.00019   -1.63095    0.00000
H     1.02777   -4.10923    0.00000
H    -0.51382   -4.10958    0.89051
H    -0.51382   -4.10958   -0.89051
C    -1.19176    3.55653    0.00000
C    -1.13832    2.17152    0.00000
N     0.00000    1.48516    0.00000
H     2.04975    1.58334    0.00000
H     2.14610    4.06470    0.00000
H    -0.00053    5.34527    0.00000
H    -2.14680    4.06412    0.00000
H    -2.04977    1.58276    0.00000
C     1.13813    2.17184    0.00000
C    -0.00038    4.26253    0.00000
C     1.19120    3.55686    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-MeI_pyr"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
