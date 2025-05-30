using DoNOF

mol = """
0 1
C     1.71526   -0.00076    0.55154
H     1.25124   -0.46993    1.42491
O     1.91711   -0.95895   -0.48586
C     0.82211    1.10132    0.00424
H     0.64233    1.82064    0.80810
H     1.36693    1.62845   -0.78061
C    -0.50966    0.60356   -0.56146
H    -0.32947   -0.03794   -1.42287
H    -1.09554    1.45723   -0.90623
H     2.49837   -1.64370   -0.14598
H     2.66837    0.42944    0.87314
C    -1.34674   -0.15908    0.44911
H    -0.86241   -1.10613    0.70213
H    -1.45015    0.42835    1.36931
O    -2.62331   -0.39415   -0.14382
H    -3.12587   -0.95186    0.45499
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B54"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
