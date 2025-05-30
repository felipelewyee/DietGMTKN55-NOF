using DoNOF

mol = """
0 1
C    -1.19880    0.69213    0.00000
C    -1.19880   -0.69213    0.00000
C     0.00000   -1.38425    0.00000
C     1.19880   -0.69213    0.00000
C     1.19880    0.69213    0.00000
C     0.00000    1.38425    0.00000
H    -2.13315   -1.23158    0.00000
H     0.00000   -2.46315    0.00000
H     2.13315   -1.23158    0.00000
H     2.13315    1.23158    0.00000
H     0.00000    2.46315    0.00000
H    -2.13315    1.23158    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-C6H6"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
