using DoNOF

mol = """
0 1
C     0.00000    0.00000    0.76601
C     0.00000    0.00000   -0.76601
H    -0.88440    0.51061    1.16226
H     0.00000   -1.02122    1.16226
H     0.88440    0.51061    1.16226
H     0.88440   -0.51061   -1.16226
H    -0.88440   -0.51061   -1.16226
H     0.00000    1.02122   -1.16226
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DIPCS10-c2h6"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
