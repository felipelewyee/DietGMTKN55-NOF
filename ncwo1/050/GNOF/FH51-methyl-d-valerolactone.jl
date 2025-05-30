using DoNOF

mol = """
0 1
C    -3.18153   -1.02120    0.11446
C    -1.64311   -1.03863    0.12997
C    -0.99798    0.33509    0.34206
C    -3.18267    1.29677    0.98928
C    -3.71161   -0.10632    1.21642
H    -1.26758   -1.36787   -0.85065
H    -3.54164   -0.65255   -0.86011
H    -3.56503   -2.04721    0.22474
H    -3.41731    1.97049    1.82408
H    -3.61245    1.72856    0.06960
H    -3.40392   -0.46948    2.20954
H    -4.81180   -0.07236    1.21369
O    -1.73617    1.36280    0.85871
O     0.17738    0.53214    0.11954
C    -1.07440   -2.00861    1.18629
H    -1.40766   -3.03348    0.96936
H     0.02223   -1.98762    1.17580
H    -1.41087   -1.74894    2.20034
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-methyl-d-valerolactone"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
