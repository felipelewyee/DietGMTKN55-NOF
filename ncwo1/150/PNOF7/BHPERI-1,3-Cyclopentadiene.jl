using DoNOF

mol = """
0 1
H    -1.78936    0.87878    0.00010
C    -1.12663    0.00011   -0.00000
C    -0.19168    0.00002   -1.18135
C     1.08468   -0.00033   -0.73469
C     1.08468    0.00037    0.73470
C    -0.19169   -0.00041    1.18135
H    -1.78984   -0.87818   -0.00011
H    -0.51850   -0.00064    2.21454
H    -0.51849    0.00009   -2.21454
H     1.97842   -0.00043   -1.34935
H     1.97841    0.00061    1.34936
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-1,3-Cyclopentadiene"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
