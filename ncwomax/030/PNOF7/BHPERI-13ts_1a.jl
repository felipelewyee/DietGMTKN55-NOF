using DoNOF

mol = """
0 1
C     0.64644    0.66205    0.00000
C     0.62059   -0.72735    0.00000
O    -1.43762   -1.04803    0.00000
N    -1.81431    0.12667    0.00000
N    -1.28272    1.17289    0.00000
H     0.87969    1.19136    0.91554
H     0.87969    1.19136   -0.91554
H     0.75412   -1.28448    0.91763
H     0.75412   -1.28448   -0.91763
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13ts_1a"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
