using DoNOF

mol = """
0 1
C     0.00000    0.22683    0.00000
N     0.01764   -1.29658    0.00000
B    -1.36234    0.81108    0.00000
B     1.34221    0.86377    0.00000
H    -0.94280   -1.63993    0.00000
H     0.49365   -1.66477    0.82061
H     0.49365   -1.66477   -0.82061
H    -1.52030    1.99125    0.00000
H    -2.32666    0.08034    0.00000
H     2.34205    0.18782    0.00000
H     1.43761    2.05085    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nh3-cbh22"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
