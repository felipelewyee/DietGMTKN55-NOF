using DoNOF

mol = """
0 1
C    -0.26286    0.40275    0.43360
C     0.77683    1.33862   -0.14462
C     1.17465    0.13003    0.04405
C    -1.37786   -0.10239   -0.39263
C     2.18589   -0.93727   -0.01630
C    -2.57176   -0.45764    0.07171
H     0.95877    2.34390   -0.47803
H    -1.17310   -0.17761   -1.45759
H     2.38273   -1.33128    0.98341
H     1.82158   -1.77127   -0.61971
H    -2.80830   -0.39197    1.12708
H    -3.35120   -0.82231   -0.58255
H     3.12284   -0.57831   -0.44188
H    -0.50273    0.48427    1.49445
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P26"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
