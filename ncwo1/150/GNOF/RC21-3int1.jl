using DoNOF

mol = """
1 2
C     0.84650    0.18760    0.00000
C     0.09367    0.02437   -1.24105
C    -1.21937   -0.35284   -1.22334
C    -1.87425   -0.52791    0.00000
C    -1.21937   -0.35284    1.22334
C     0.09367    0.02437    1.24105
C     2.08423    0.97880    0.00000
H     2.57641    1.21110    0.93390
H     2.57641    1.21110   -0.93390
H     0.62461    0.16020   -2.17729
H    -1.75686   -0.50274   -2.15133
H    -2.91897   -0.82026    0.00000
H     0.62461    0.16020    2.17729
H     1.22558   -0.89843    0.00000
H    -1.75686   -0.50274    2.15133
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-3int1"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
