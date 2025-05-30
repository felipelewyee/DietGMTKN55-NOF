using DoNOF

mol = """
0 1
C     0.00000    0.00000   -1.21291
H     0.00000    0.94166   -1.73601
H     0.00000   -0.94166   -1.73601
C     0.00000    0.00000    0.10312
O     0.00000    0.00000    1.26634
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-ketene"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
