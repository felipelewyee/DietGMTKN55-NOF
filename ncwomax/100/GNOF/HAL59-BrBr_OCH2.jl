using DoNOF

mol = """
0 1
Br   -0.94476   -1.65425    0.00000
Br    0.00000    0.43183    0.00000
O     1.40671    2.80309    0.00000
C     2.58555    2.57242    0.00000
H     2.97160    1.53896    0.00000
H     3.32804    3.38654    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-BrBr_OCH2"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
