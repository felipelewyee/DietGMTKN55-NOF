using DoNOF

mol = """
0 1
C    -0.62422    0.28594    0.00000
H    -0.68092    1.36354    0.00000
H    -1.48969   -0.35847    0.00000
N     0.55574   -0.26925    0.00000
H     0.55369   -1.30177    0.00000
O     1.68540    0.28000    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13r_7"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
