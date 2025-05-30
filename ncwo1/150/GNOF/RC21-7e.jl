using DoNOF

mol = """
1 2
O    -1.48308    1.34440   -0.46202
C    -1.40032    0.14303   -0.61588
O    -1.85008   -0.50051   -1.63482
C    -0.75641   -0.40466    0.59332
C     0.58019   -0.23396    0.85058
C     1.54896    0.52138    0.06604
H    -1.70063   -1.45724   -1.57682
H    -1.43132   -0.81515    1.34129
H     0.95443   -0.74678    1.73586
H     1.14656    1.00384   -0.82161
H     2.38885   -0.13873   -0.19133
H     2.00284    1.28438    0.71540
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-7e"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
