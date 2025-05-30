using DoNOF

mol = """
0 2
C    -1.37322   -0.51844   -0.00005
C    -0.39256    0.63146    0.00000
N     1.97764   -0.41045   -0.00008
H    -1.24171   -1.14679   -0.88053
H    -1.24168   -1.14689    0.88036
H    -2.40455   -0.15645   -0.00000
H    -0.40975    1.24584   -0.89725
H    -0.40973    1.24575    0.89731
H     0.77753    0.07768   -0.00006
H     2.35912    0.08944   -0.80483
H     2.35892    0.08885    0.80513
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT20"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
