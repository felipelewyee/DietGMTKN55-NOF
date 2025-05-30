using DoNOF

mol = """
0 1
C     0.29646   -1.22712    0.00000
P    -0.07275    0.38782    0.00000
B    -0.92396   -2.13544    0.00000
B     1.75227   -1.65681    0.00000
F    -0.92396    0.93251    1.17374
F    -0.92396    0.93251   -1.17374
F     1.10706    1.37932    0.00000
H    -0.76152   -3.31349    0.00000
H    -2.03518   -1.69108    0.00000
H     2.64467   -0.86523    0.00000
H     1.99072   -2.82265    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-pf3-cbh22"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
