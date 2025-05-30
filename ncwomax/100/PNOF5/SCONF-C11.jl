using DoNOF

mol = """
0 1
C     2.35021    0.61496    0.25991
C     1.47606   -0.60283   -0.02740
C     0.11989   -0.24960   -0.65395
C    -0.92739    0.32076    0.33442
C    -1.84022   -0.89041    0.62445
O    -1.30122   -1.72800    1.64632
C    -1.77629   -1.65228   -0.69085
O     3.59667    0.23784    0.82571
O    -1.74525    1.32726   -0.24729
O     2.23385   -1.41106   -0.93031
O    -0.44005   -1.47240   -1.17820
C    -1.13843    2.60886   -0.32793
H     2.50061    1.17581   -0.67616
H     1.86995    1.27721    0.98690
H     1.30298   -1.15848    0.90581
H     0.26822    0.44177   -1.49422
H    -0.46539    0.69972    1.25882
H    -2.85480   -0.55600    0.86924
H    -1.40144   -1.29253    2.50294
H    -1.95436   -2.72213   -0.56022
H    -2.49766   -1.23668   -1.40670
H     3.95615   -0.46789    0.26759
H     1.65272   -2.12712   -1.22842
H    -0.85071    2.97344    0.66951
H    -0.25041    2.60703   -0.97510
H    -1.88371    3.28275   -0.75487
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "SCONF-C11"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
