using DoNOF

mol = """
0 1
C     0.27999    0.71620   -1.22260
C    -0.27999   -0.71620   -1.22260
C     0.00000    0.00000    1.10359
C     0.00000    1.20485    0.18000
C     0.00000   -1.20485    0.18000
C    -0.26073    2.45541    0.53292
C     0.26073   -2.45541    0.53292
H    -0.14890    1.36051   -1.98812
H     1.36186    0.67963   -1.38675
H     0.14890   -1.36051   -1.98812
H    -1.36186   -0.67963   -1.38675
H    -0.87641    0.00630    1.75549
H     0.87641   -0.00630    1.75549
H    -0.26599    3.25796   -0.19309
H    -0.47492    2.72295    1.55981
H     0.26599   -3.25796   -0.19309
H     0.47492   -2.72295    1.55981
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P60"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
