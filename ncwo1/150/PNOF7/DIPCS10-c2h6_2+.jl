using DoNOF

mol = """
2 1
C     0.13123   -0.66179    0.00000
C    -0.13123    0.66179    0.00000
H    -0.80708   -1.32583    0.49167
H    -0.80708   -1.32583   -0.49167
H     1.08171   -1.20630    0.00000
H     0.80708    1.32583   -0.49167
H    -1.08171    1.20630    0.00000
H     0.80708    1.32583    0.49167
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DIPCS10-c2h6_2+"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
