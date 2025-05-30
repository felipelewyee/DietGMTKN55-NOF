using DoNOF

mol = """
0 1
C    -1.43893   -0.10981    0.53207
H    -2.47234    0.07457    0.82488
O    -1.47253   -1.08355   -0.50245
C    -0.79822    1.20409    0.08704
H    -1.45704    1.69415   -0.63221
H    -0.73096    1.86121    0.95990
C     0.59163    1.05614   -0.54380
H     1.01261    2.05247   -0.69992
H     0.50353    0.59623   -1.53048
H    -0.58610   -1.46237   -0.50394
H    -0.91678   -0.50572    1.40801
C     1.58071    0.23808    0.28169
H     2.60614    0.47205   -0.01114
H     1.48113    0.46927    1.34252
O     1.36072   -1.17961    0.16619
H     1.84313   -1.47756   -0.60953
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B4"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
