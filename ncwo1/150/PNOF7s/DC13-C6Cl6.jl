using DoNOF

mol = """
0 1
C    -1.20459    0.69547    0.00000
C    -1.20459   -0.69547    0.00000
C    -0.00000   -1.39096    0.00000
C     1.20459   -0.69547    0.00000
C     1.20459    0.69547    0.00000
C    -0.00000    1.39096    0.00000
Cl   -2.68272   -1.54889    0.00000
Cl   -0.00000   -3.09765    0.00000
Cl    2.68272   -1.54889    0.00000
Cl    2.68272    1.54889    0.00000
Cl   -0.00000    3.09765    0.00000
Cl   -2.68272    1.54889    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-C6Cl6"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
