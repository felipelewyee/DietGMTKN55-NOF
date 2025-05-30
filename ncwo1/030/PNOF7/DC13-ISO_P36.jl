using DoNOF

mol = """
0 1
O    -0.01773    2.66105    0.00000
C     0.04045    1.43947    0.00000
C     1.23976    0.62456    0.00000
C     1.18016   -0.73501    0.00000
C    -0.06560   -1.42504    0.00000
C    -1.20531   -0.68575    0.00000
N    -1.14501    0.67499    0.00000
H     2.18017    1.15832    0.00000
H     2.09903   -1.31074    0.00000
H    -0.11365   -2.50384    0.00000
H    -2.19653   -1.11955    0.00000
H    -1.99575    1.22155    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-ISO_P36"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
