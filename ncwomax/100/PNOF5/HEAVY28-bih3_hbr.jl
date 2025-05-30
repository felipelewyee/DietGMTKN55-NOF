using DoNOF

mol = """
0 1
Bi    0.00000    0.00000    1.03200
H    -0.71872    1.24486    2.05030
H    -0.71872   -1.24486    2.05030
H     1.43744    0.00000    2.05030
Br    0.00000    0.00000   -2.88357
H     0.00000    0.00000   -4.29933
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-bih3_hbr"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
