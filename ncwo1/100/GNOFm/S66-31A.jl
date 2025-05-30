using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N    -0.00865   -1.30414   -0.01921
H    -0.01100   -2.31475   -0.00335
C    -1.26659   -0.68593   -0.04915
O    -2.28500   -1.35661   -0.05900
C    -1.19460    0.76399   -0.06540
H    -2.11052    1.32741   -0.10795
C     0.00703    1.37378   -0.01947
H     0.11259    2.44842   -0.02129
N     1.17675    0.66623    0.03867
H     2.06594    1.13272    0.10252
C     1.23541   -0.71589    0.06260
O     2.27862   -1.33524    0.14101
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-31A"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
