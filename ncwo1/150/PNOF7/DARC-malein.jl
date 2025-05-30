using DoNOF

mol = """
0 1
C     1.12083    0.00000    0.62433
C     0.66344    0.00000   -0.78669
C    -0.66344    0.00000   -0.78669
C    -1.12083    0.00000    0.62433
O     0.00000    0.00000    1.42741
O     2.22312    0.00000    1.06366
O    -2.22312    0.00000    1.06366
H     1.35627    0.00000   -1.61501
H    -1.35627    0.00000   -1.61501
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DARC-malein"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
