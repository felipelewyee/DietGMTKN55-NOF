using DoNOF

mol = """
0 1
C    -1.60787   -0.31747    0.31592
H    -2.31389   -0.88647   -0.26673
H    -1.62499   -0.36553    1.39673
S    -0.16698   -0.06574   -0.45700
C     1.22081   -1.06918    0.21515
C     0.46703    1.50357    0.17771
H     1.24595   -0.94516    1.29755
H     2.16545   -0.76153   -0.23353
H     0.99677   -2.10238   -0.03780
H     0.44313    1.46775    1.26621
H    -0.20332    2.27793   -0.18354
H     1.48271    1.66573   -0.17959
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-me2s-ch2"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
