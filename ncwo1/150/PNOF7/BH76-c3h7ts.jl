using DoNOF

mol = """
0 2
C    -0.59350    0.66586   -0.00005
C    -1.50399   -0.34396   -0.00001
H    -0.35341    1.18451   -0.91727
H    -0.35371    1.18469    0.91717
H    -1.84850   -0.78988    0.92252
H    -1.84830   -0.79020   -0.92244
C     1.49065   -0.22226    0.00003
H     2.07381    0.68860   -0.00127
H     1.46806   -0.78969   -0.91864
H     1.46888   -0.78767    0.91996
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-c3h7ts"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
