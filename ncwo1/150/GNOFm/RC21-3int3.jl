using DoNOF

mol = """
1 2
C    -0.48955    0.00881   -1.58594
C     0.84103   -0.00852   -1.29527
C     1.54177   -0.02290    0.00000
C     0.84103   -0.00852    1.29527
C    -0.48955    0.00881    1.58594
C    -1.58078    0.01895    0.69193
C    -1.58078    0.01895   -0.69193
H    -0.74901    0.01517   -2.63930
H     1.51433   -0.01438   -2.14867
H     2.27237    0.80822    0.00000
H     2.23653   -0.88474    0.00000
H     1.51433   -0.01438    2.14867
H    -0.74901    0.01517    2.63930
H    -2.56137    0.02968    1.15759
H    -2.56137    0.02968   -1.15759
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-3int3"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
