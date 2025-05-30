using DoNOF

mol = """
1 2
C     0.00000    1.15366    0.20773
C     0.00000    0.70006   -1.11010
C     0.00000   -0.70006   -1.11010
C     0.00000   -1.15366    0.20773
C     0.00000    0.00000    1.13580
H     0.00000    2.19207    0.51692
H     0.00000    1.33090   -1.98945
H     0.00000   -1.33090   -1.98945
H     0.00000   -2.19207    0.51692
H    -0.87179    0.00000    1.80700
H     0.87179    0.00000    1.80700
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-9p1"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
