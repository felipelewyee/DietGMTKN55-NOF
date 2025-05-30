using DoNOF

mol = """
0 1
O    -1.23111    0.09790   -0.05372
H    -0.11774    0.03367   -0.06528
H    -1.46897   -0.65592    0.49310
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-10B"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
