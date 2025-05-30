using DoNOF

mol = """
0 1
N    -0.04320   -1.22121   -1.12696
H    -0.04555   -2.23182   -1.11110
C    -1.30114   -0.60301   -1.15690
O    -2.31955   -1.27368   -1.16675
C    -1.22915    0.84692   -1.17315
H    -2.14507    1.41033   -1.21570
C    -0.02752    1.45671   -1.12722
H     0.07804    2.53135   -1.12904
N     1.14220    0.74915   -1.06908
H     2.03139    1.21564   -1.00523
C     1.20086   -0.63296   -1.04515
O     2.24407   -1.25232   -0.96674
C     0.73368   -0.21608    2.23727
H     1.25080   -1.08706    1.86004
H     1.33929    0.57092    2.66458
C    -0.59510   -0.11549    2.18802
H    -1.20710   -0.90297    1.77112
H    -1.10692    0.75558    2.57202
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-31"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
