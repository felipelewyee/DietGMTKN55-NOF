using DoNOF

mol = """
0 1
C    -2.52404   -0.10506    0.35411
H    -2.73942   -0.69791   -0.53479
H    -2.47502   -0.78843    1.20160
H    -3.36072    0.57496    0.51017
C    -1.21040    0.64930    0.19217
H    -1.03740    1.28045    1.06748
H    -1.27487    1.32546   -0.66368
C    -0.02220   -0.28469    0.00276
H     0.06075   -0.94512    0.87081
H    -0.20955   -0.93598   -0.85602
C     1.29430    0.45119   -0.20823
H     1.46294    1.13779    0.62522
H     1.21740    1.07376   -1.10252
C     2.47888   -0.49684   -0.33977
H     2.34004   -1.17320   -1.18298
H     3.41280    0.04171   -0.49319
H     2.58650   -1.10739    0.55685
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-61A"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
