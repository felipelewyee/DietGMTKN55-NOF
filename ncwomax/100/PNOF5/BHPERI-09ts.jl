using DoNOF

mol = """
0 1
C     0.82812   -0.21159    1.20475
S     1.44230   -1.34966    0.00000
C    -1.24908   -0.55022    0.70216
C     0.92063    1.10966    0.68648
C     0.82812   -0.21159   -1.20475
C    -1.24908   -0.55022   -0.70216
C     0.92063    1.10966   -0.68648
H     0.95674   -0.45976    2.25015
H    -1.31253   -1.49359    1.23029
H    -1.67759    0.29044    1.23348
H     0.81257    1.98989    1.30729
H     0.95674   -0.45976   -2.25015
H    -1.31253   -1.49359   -1.23029
H    -1.67759    0.29044   -1.23348
H     0.81257    1.98989   -1.30729
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-09ts"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
