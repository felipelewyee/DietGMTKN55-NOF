using DoNOF

mol = """
0 1
C    -0.38933    0.34585    0.00000
C     0.27063    1.54600    0.64244
C     0.27063    1.54600   -0.64244
C     0.27063   -0.97581    0.00000
C    -0.36828   -2.14105    0.00000
H    -1.47732    0.29494    0.00000
H     0.54031    2.00432    1.57613
H     0.54031    2.00432   -1.57613
H     1.35703   -0.95739    0.00000
H    -1.45061   -2.19069    0.00000
H     0.16460   -3.08147    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P20"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
