using DoNOF

mol = """
0 1
N     0.05076    0.70669   -0.22188
N    -0.05076   -0.70669   -0.22188
H     0.85238   -1.08388   -0.45778
H    -0.32359   -1.07405    0.67965
H    -0.85238    1.08388   -0.45778
H     0.32359    1.07405    0.67965
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-n2h4_st1"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
