using DoNOF

mol = """
0 1
C    -2.53044   -0.30155   -0.01189
H    -2.53881   -0.96350   -0.87830
H    -2.58236   -0.92781    0.87870
H    -3.43286    0.30736   -0.04465
C    -1.26991    0.55306   -0.00082
H    -1.28656    1.22605    0.85959
H    -1.24464    1.18727   -0.88961
C     0.00001   -0.28528    0.03964
H     0.00001   -0.90307    0.94270
H     0.00008   -0.97357   -0.80960
C     1.26991    0.55310   -0.00073
H     1.28653    1.22607    0.85969
H     1.24476    1.18727   -0.88953
C     2.53043   -0.30154   -0.01168
H     2.53881   -0.96352   -0.87806
H     3.43281    0.30740   -0.04440
H     2.58225   -0.92775    0.87896
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-45B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
