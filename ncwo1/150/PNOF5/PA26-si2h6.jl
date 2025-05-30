using DoNOF

mol = """
0 1
Si    0.00000    0.00000    1.16091
Si    0.00000    0.00000   -1.16091
H     1.19703    0.69110    1.67796
H     0.00000   -1.38221    1.67796
H    -1.19703    0.69110    1.67796
H     1.19703   -0.69110   -1.67796
H     0.00000    1.38221   -1.67796
H    -1.19703   -0.69110   -1.67796
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-si2h6"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
