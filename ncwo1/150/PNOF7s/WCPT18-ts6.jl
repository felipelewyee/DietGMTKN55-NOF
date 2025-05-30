using DoNOF

mol = """
0 1
C     0.05723   -0.40455    0.00000
H     0.09488   -1.49037    0.00000
C     0.05723    0.19347    1.29046
H     0.01607    1.26600    1.41067
H    -1.06827   -0.07144    0.00000
H    -0.04442   -0.43227    2.16092
C     0.05723    0.19347   -1.29046
H    -0.04442   -0.43227   -2.16092
H     0.01607    1.26600   -1.41067
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts6"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
