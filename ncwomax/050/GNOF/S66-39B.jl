using DoNOF

mol = """
0 1
C    -0.84773   -0.86695   -0.39884
H    -0.95398   -0.69200   -1.47115
H    -1.49937   -1.69621   -0.12569
C     0.62181   -1.12401   -0.05471
H     1.11704   -1.76160   -0.78530
H     0.68509   -1.62422    0.91275
C     1.26195    0.28139    0.03624
H     1.91222    0.47406   -0.81561
H     1.87482    0.37056    0.93196
C     0.08290    1.28056    0.06311
H    -0.03425    1.73953   -0.91917
H     0.22850    2.08207    0.78551
C    -1.15087    0.42347    0.35876
H    -2.08186    0.89921    0.05285
H    -1.21629    0.21415    1.42930
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-39B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
