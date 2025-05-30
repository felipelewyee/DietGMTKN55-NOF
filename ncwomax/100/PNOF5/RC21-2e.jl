using DoNOF

mol = """
1 2
C    -2.39839    0.07528   -0.37062
C    -1.16157   -0.36331    0.37130
O     0.00000    0.00000   -0.32991
C     1.16157    0.36331    0.37130
C     2.39839   -0.07528   -0.37062
H    -3.26574   -0.33461    0.14857
H    -2.40169   -0.29020   -1.39750
H    -2.46904    1.16419   -0.37190
H    -1.10654   -1.47612    0.37047
H    -1.08655   -0.03934    1.41463
H     1.08655    0.03934    1.41463
H     1.10654    1.47612    0.37047
H     2.46904   -1.16419   -0.37190
H     3.26574    0.33461    0.14857
H     2.40169    0.29020   -1.39750
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-2e"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
