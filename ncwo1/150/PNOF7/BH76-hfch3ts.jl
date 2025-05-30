using DoNOF

mol = """
0 2
H     0.00037    2.26247    0.00000
F    -0.00011    1.02398    0.00000
C    -0.00011   -0.64467    0.00000
H     1.05369   -0.88007    0.00000
H    -0.52692   -0.88086    0.91235
H    -0.52692   -0.88086   -0.91235
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-hfch3ts"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
