using DoNOF

mol = """
1 1
N    -2.14953   -0.39732    0.00000
C    -2.60094    0.85642    0.00000
N    -1.58000    1.68086    0.00000
C    -0.41986    0.94399    0.00000
C     0.95486    1.31587    0.00000
O     1.42843    2.43259    0.00000
N     1.75022    0.17312    0.00000
C     1.30396   -1.12076    0.00000
N     2.21947   -2.08029    0.00000
N     0.02489   -1.43869    0.00000
C    -0.77990   -0.38160    0.00000
H    -2.73850   -1.22114    0.00000
H     3.20858   -1.89461    0.00000
H     1.92303   -3.04238    0.00000
H    -3.63960    1.14354    0.00000
H     2.75057    0.33950    0.00000
H    -1.65567    2.69090    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-Gp"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
