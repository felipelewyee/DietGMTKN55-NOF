using DoNOF

mol = """
1 1
Li   -0.40901   -1.91404    0.08129
O     0.39025   -0.23650   -0.02177
H     1.33196   -0.03791   -0.09510
H    -0.04709    0.62391   -0.01348
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CHB6-22"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
