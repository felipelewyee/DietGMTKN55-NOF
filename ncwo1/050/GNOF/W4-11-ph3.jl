using DoNOF

mol = """
0 1
P     0.00000    0.00000    0.12741
H     0.00000    1.19034   -0.63704
H    -1.03087   -0.59517   -0.63704
H     1.03087   -0.59517   -0.63704
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-ph3"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
