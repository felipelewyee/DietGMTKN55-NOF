using DoNOF

mol = """
0 1
C     0.86520    1.04548    0.31726
H     1.53713    1.85724    0.56137
C     1.33731   -0.26560    0.29015
H     2.37542   -0.47130    0.51398
C     0.47189   -1.31130   -0.02647
H     0.83785   -2.32884   -0.04668
C    -0.86528   -1.04574   -0.31686
H    -1.53680   -1.85732   -0.56151
C    -1.33741    0.26564   -0.29046
H    -2.37503    0.47154   -0.51520
C    -0.47225    1.31126    0.02708
H    -0.83804    2.32895    0.04734
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-39A"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
