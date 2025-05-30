using DoNOF

mol = """
0 1
N     0.00000    0.00000   -0.28909
H    -0.46759   -0.80989    0.09636
H    -0.46759    0.80989    0.09636
H     0.93518    0.00000    0.09636
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "SIE4x4-nh3"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
