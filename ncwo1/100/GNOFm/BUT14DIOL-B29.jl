using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.41980    1.91047    0.39925
H     1.05654    1.91092    1.29086
O     1.19899    2.09635   -0.77850
C    -0.41980    0.63835    0.36283
H    -1.08082    0.63728    1.23575
H    -1.04862    0.67720   -0.52955
C     0.41980   -0.63835    0.36283
H     1.08082   -0.63728    1.23575
H     1.04862   -0.67720   -0.52955
H     1.86787    1.40760   -0.79803
H    -0.22870    2.78307    0.45653
C    -0.41980   -1.91047    0.39925
H     0.22870   -2.78307    0.45653
H    -1.05654   -1.91092    1.29086
O    -1.19899   -2.09635   -0.77850
H    -1.86787   -1.40760   -0.79803
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B29"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
