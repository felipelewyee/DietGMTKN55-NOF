using DoNOF

mol = """
0 1
S     0.98780    1.69086   -0.05066
N    -1.61021    1.29842   -0.15111
N    -0.45938   -0.56434    0.46248
C    -0.39188    0.81146    0.08312
H    -2.39945    0.68604   -0.07469
H    -1.71733    2.24968   -0.44738
H    -0.09355   -0.62431    1.40485
C     0.35853   -1.43528   -0.38652
C     0.17576   -2.87823    0.01790
H     0.02639   -1.29125   -1.41240
H     1.41001   -1.14571   -0.34148
H    -0.86057   -3.18391   -0.09862
H     0.79399   -3.52648   -0.59574
H     0.46967   -3.03395    1.05529
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-ethylthiourea_TS1"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
