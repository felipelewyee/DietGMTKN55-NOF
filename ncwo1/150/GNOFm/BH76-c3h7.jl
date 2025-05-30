using DoNOF

mol = """
0 2
C     1.12259   -0.26248    0.00005
C    -0.15121    0.60084   -0.00006
C    -1.40064   -0.21481   -0.00002
H     1.15552   -0.90368    0.88123
H     1.15554   -0.90387   -0.88099
H     2.01602    0.36344   -0.00001
H    -0.13407    1.25156   -0.87710
H    -0.13413    1.25175    0.87683
H    -1.81500   -0.59106    0.92443
H    -1.81462   -0.59170   -0.92437
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-c3h7"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
