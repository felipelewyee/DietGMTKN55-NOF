using DoNOF

mol = """
0 1
N     0.00000    0.00000    1.14272
C    -1.12416    0.00000    0.35290
C     1.12416    0.00000    0.35290
C    -0.71190    0.00000   -0.96007
C     0.71190    0.00000   -0.96007
H     0.00000    0.00000    2.14834
H    -2.11145    0.00000    0.78526
H     2.11145    0.00000    0.78526
H    -1.35854    0.00000   -1.82362
H     1.35854    0.00000   -1.82362
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-05r"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
