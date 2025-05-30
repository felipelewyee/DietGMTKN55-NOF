using DoNOF

mol = """
0 1
C    -0.29186   -2.89452    0.00000
H     0.66836   -3.40596    0.00000
H    -1.17802   -3.52183    0.00000
C    -0.37380   -1.55391    0.00000
H    -1.35953   -1.09228    0.00000
C     0.78457   -0.67769    0.00000
H     1.75029   -1.18240    0.00000
C     0.78457    0.67769    0.00000
H     1.75029    1.18240    0.00000
C    -0.37380    1.55391    0.00000
H    -1.35953    1.09228    0.00000
C    -0.29186    2.89452    0.00000
H     0.66836    3.40596    0.00000
H    -1.17802    3.52183    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-cis-1,3,5-Hexatriene"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
