using DoNOF

mol = """
0 1
C     0.00000   -1.17163    0.19064
C     0.00000   -0.72993   -1.07678
C     0.00000    0.72993   -1.07678
C     0.00000    1.17163    0.19064
C     0.00000    0.00000    1.11579
H     0.00000   -2.20239    0.51729
H     0.00000   -1.34551   -1.96712
H     0.00000    1.34551   -1.96712
H     0.00000    2.20239    0.51729
H    -0.87580    0.00000    1.77808
H     0.87580    0.00000    1.77808
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DARC-cpdiene"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
