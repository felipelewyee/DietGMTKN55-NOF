using DoNOF

mol = """
0 1
C     0.16001    0.29411   -1.35470
H     0.28214    0.51960   -2.40513
C    -0.93107   -0.46079   -0.92737
H    -1.65157   -0.81730   -1.65106
C    -1.09177   -0.75491    0.42558
H    -1.93887   -1.34088    0.75583
C    -0.15988   -0.29386    1.35408
H    -0.28378   -0.52182    2.40408
C     0.93170    0.46124    0.92884
H     1.65482    0.81908    1.64922
C     1.09050    0.75473   -0.42466
H     1.93776    1.34080   -0.75470
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-47B"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
