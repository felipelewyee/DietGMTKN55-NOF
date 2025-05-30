using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N     0.00000    0.00000    4.09665
C     0.00000    0.00000    5.23893
H     0.00000    0.00000    6.30634
I     0.00000    0.00000    0.83791
C     0.00000    0.00000   -1.25744
C     0.00000    1.20351   -1.94854
C     0.00000    1.19862   -3.33578
C     0.00000    0.00000   -4.03236
C     0.00000   -1.19862   -3.33578
C     0.00000   -1.20351   -1.94854
H     0.00000    2.14116   -1.40869
H     0.00000    2.13945   -3.87144
H     0.00000    0.00000   -5.11472
H     0.00000   -2.13945   -3.87144
H     0.00000   -2.14116   -1.40869
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NCH_PhI"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
