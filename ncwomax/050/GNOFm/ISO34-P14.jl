using DoNOF

mol = """
0 1
C     0.00000    0.00000    0.48303
N     0.00000    0.00000   -0.93725
C     0.00000    0.00000   -2.10376
H     0.51296   -0.88846    0.85266
H     0.51296    0.88846    0.85266
H    -1.02591    0.00000    0.85266
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-P14"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
