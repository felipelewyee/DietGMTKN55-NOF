using DoNOF

mol = """
1 1
N    -0.51284    1.85717    0.00000
N     1.49205    0.71148    0.00000
C    -0.54614   -0.52361    0.00000
C     0.86036   -0.46836    0.00000
C    -1.17336    0.68706    0.00000
C     0.86379    1.97100    0.00000
C    -1.27082   -1.83417    0.00000
O     1.51339   -1.58666    0.00000
O     1.47180    2.98989    0.00000
H    -1.02436    2.73251    0.00000
H     2.50731    0.76854    0.00000
H    -2.25442    0.75642    0.00000
H    -1.02878   -2.42789   -0.88159
H    -1.02878   -2.42789    0.88159
H    -2.34748   -1.67297    0.00000
H     2.47827   -1.53251    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-T0"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
