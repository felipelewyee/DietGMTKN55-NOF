using DoNOF

mol = """
0 1
O     1.08319    0.07113    0.00000
N     0.00000    0.54944    0.00000
O    -1.01444   -0.39532    0.00000
H    -0.55000   -1.25255    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-c-hono"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
