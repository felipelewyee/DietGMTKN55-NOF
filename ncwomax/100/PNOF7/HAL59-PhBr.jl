using DoNOF

mol = """
0 1
Br    0.00000    0.00000    1.79415
C     0.00000    0.00000   -0.09765
C     0.00000    1.20710   -0.77580
C     0.00000    1.19966   -2.16302
C     0.00000    0.00000   -2.85802
C     0.00000   -1.19966   -2.16302
C     0.00000   -1.20710   -0.77580
H     0.00000    2.13903   -0.22757
H     0.00000    2.13950   -2.69998
H     0.00000    0.00000   -3.94016
H     0.00000   -2.13950   -2.69998
H     0.00000   -2.13903   -0.22757
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PhBr"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
