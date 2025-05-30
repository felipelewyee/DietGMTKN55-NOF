using DoNOF

mol = """
1 2
C    -2.05115   -0.11243    0.09045
C    -1.42122    1.15153    0.06241
C    -0.06323    1.21684    0.00384
C     0.72268    0.01610   -0.02629
C     2.18270    0.11124   -0.09103
C     0.06477   -1.24844    0.00066
C    -1.29407   -1.31157    0.05915
H    -3.13326   -0.16921    0.13584
H    -2.02266    2.05154    0.08750
H     0.44845    2.17231   -0.01960
H     2.68099   -0.85381   -0.04165
H     2.55617    0.77068    0.70371
H     2.47155    0.62074   -1.02352
H     0.66489   -2.15014   -0.02398
H    -1.80661   -2.26538    0.08250
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-3e"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
