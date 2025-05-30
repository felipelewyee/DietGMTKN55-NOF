using DoNOF

mol = """
0 1
C    -0.38359    0.18634   -0.19210
C    -1.14140   -0.33126    1.06306
C    -0.28351   -0.21064    2.30404
C     1.00439    0.14691    2.32206
C     1.82347    0.36757    1.08249
C     1.12492   -0.19009   -0.16703
C     1.87535    0.27486   -1.44235
C     3.39569    0.44705   -1.20449
C     3.89906   -0.54906   -0.14932
C     3.23191   -0.27884    1.22323
C    -2.50657    0.39670    1.29779
C    -3.33420   -0.31122    2.38764
C    -3.37121    0.51137    0.03010
C    -0.96053   -0.40489   -1.47090
O    -1.20641   -1.58109   -1.64406
O    -1.10937    0.54167   -2.44139
C    -1.58762    0.05264   -3.71827
H    -0.45736    1.28103   -0.23582
H    -1.37171   -1.39525    0.89124
H    -0.77842   -0.40579    3.25342
H     1.52082    0.24487    3.27899
H     1.44557    1.22373   -1.78966
H     1.70480   -0.45900   -2.24164
H     3.93924    0.32227   -2.14987
H     3.60109    1.46879   -0.85379
H     4.99165   -0.50031   -0.05510
H     3.65440   -1.56753   -0.48308
H     3.13579   -1.22239    1.77804
H     3.86183    0.38671    1.82963
H    -2.27160    1.41613    1.64270
H    -2.83039   -0.33671    3.36004
H    -3.54542   -1.34643    2.08314
H    -4.29440    0.20326    2.52441
H    -3.55975   -0.48147   -0.40015
H    -2.90365    1.13927   -0.73541
H    -4.34028    0.96090    0.28415
H    -1.62956    0.93103   -4.36715
H    -2.58120   -0.39695   -3.60403
H    -0.89887   -0.69927   -4.12129
H     1.17138   -1.28692   -0.10362
H     1.96566    1.45202    0.93437
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISOL24-i2e"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
