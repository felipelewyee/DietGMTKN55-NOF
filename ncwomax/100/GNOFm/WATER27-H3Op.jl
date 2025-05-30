using DoNOF

mol = """
1 1
O     0.00000    0.00000   -0.20801
H     0.46976    0.81364    0.06934
H     0.46976   -0.81364    0.06934
H    -0.93951    0.00000    0.06934
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WATER27-H3Op"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
