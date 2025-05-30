using DoNOF

mol = """
0 1
O    -0.99661    1.33886   -2.10934
Al    1.73411   -0.04567    1.94572
Si   -0.61710   -0.16954    0.89462
H    -2.89381    2.41975   -0.28011
Li    0.51417    0.35321   -1.72493
H    -1.43841    1.74395   -2.86649
Cl    1.51034   -1.72208   -2.00664
Al   -1.63886    1.47601   -0.44353
H     1.23866   -2.05187   -0.68018
H    -0.72398   -2.82577    0.98366
B     0.17062   -2.06256    1.23615
H    -0.37161    2.50397    0.44346
H     0.57741   -2.16141    2.37924
B     0.33953    1.51201    0.75409
H     1.16482   -2.30766    0.52081
H     1.43070    1.99881    0.95347
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "MB16-43-14"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
