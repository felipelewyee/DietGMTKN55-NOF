using DoNOF

mol = """
0 1
C    -0.66990    1.27470    0.00205
C     0.87648    1.24895   -0.00216
C     0.00459   -0.97822   -0.00119
C    -1.07117   -0.18003   -0.00012
C     1.25081   -0.22695   -0.00043
C    -2.50249   -0.58977    0.00000
C     2.48673   -0.72916    0.00147
H    -1.08066    1.79349   -0.86893
H    -1.07569    1.78874    0.87823
H     1.29072    1.75334    0.87061
H     1.28487    1.74870   -0.88042
H    -3.02277   -0.18945   -0.87504
H    -2.61413   -1.67310   -0.00152
H     3.35960   -0.09030    0.00229
H     2.65861   -1.79715    0.00229
H    -3.02188   -0.19201    0.87675
H    -0.02900   -2.05940   -0.00204
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R60"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
