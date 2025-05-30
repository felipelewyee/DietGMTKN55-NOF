using DoNOF

mol = """
0 1
S     0.00000    1.55234    0.92196
S     0.00000    1.06851   -0.92196
S     0.00000   -1.06851   -0.92196
S     0.00000   -1.55234    0.92196
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-s4-c2v"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
