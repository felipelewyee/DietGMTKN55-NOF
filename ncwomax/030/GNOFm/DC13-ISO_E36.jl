using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -0.05645    1.16538    0.00000
N    -1.25121    0.59328    0.00000
C    -1.30315   -0.74469    0.00000
C    -0.17534   -1.54979    0.00000
C     1.07417   -0.92604    0.00000
C     1.14872    0.45493    0.00000
O    -0.01235    2.51867    0.00000
H    -2.29768   -1.17821    0.00000
H    -0.26885   -2.62749    0.00000
H     1.98262   -1.51653    0.00000
H     2.09093    0.98548    0.00000
H    -0.93141    2.82502    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-ISO_E36"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=nothing,do_hfidr=false,do_m_diagnostic=true)
