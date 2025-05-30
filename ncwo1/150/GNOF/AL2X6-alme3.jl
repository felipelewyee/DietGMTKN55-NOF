using DoNOF

mol = """
0 1
C     0.00000    1.97299    0.00000
Al    0.00000    0.00000    0.00000
C     1.70866   -0.98650    0.00000
C    -1.70866   -0.98650    0.00000
H     0.99987    2.40813    0.00000
H    -0.53062    2.36190    0.87353
H    -0.53062    2.36190   -0.87353
H     2.31078   -0.72142   -0.87353
H     2.31078   -0.72142    0.87353
H     1.58557   -2.06998    0.00000
H    -2.58544   -0.33815    0.00000
H    -1.78016   -1.64048    0.87353
H    -1.78016   -1.64048   -0.87353
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AL2X6-alme3"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
