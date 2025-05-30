using DoNOF

mol = """
0 1
N     0.00000    0.00000    3.41528
C     0.00000    0.00000    4.55707
H     0.00000    0.00000    5.62483
I     0.00000    0.00000    0.30991
C     0.00000    0.00000   -1.82680
F     0.00000    1.24443   -2.30885
F     1.07771   -0.62222   -2.30885
F    -1.07771   -0.62222   -2.30885
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NCH_F3CI"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
