using DoNOF

mol = """
0 1
H     1.88188   -0.99346   -0.43554
C     1.06487   -0.51862    0.11906
C    -1.06559   -0.51781   -0.11929
C     0.68379    0.84035   -0.08393
C    -0.68290    0.84087    0.08354
H    -1.88269   -0.99191    0.43581
H    -1.33866    1.64959    0.40321
H     0.87073   -0.97896    1.08054
H    -0.87196   -0.97869   -1.08061
H     1.34052    1.64864   -0.40280
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-TS1"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
