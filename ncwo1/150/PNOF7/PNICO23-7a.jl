using DoNOF

mol = """
0 1
P     0.09936    1.51477    0.00000
H     1.06362    1.41210    1.03446
H     1.06362    1.41210   -1.03446
O    -0.09936    3.16711    0.00000
H    -1.03113    3.38329    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-7a"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
