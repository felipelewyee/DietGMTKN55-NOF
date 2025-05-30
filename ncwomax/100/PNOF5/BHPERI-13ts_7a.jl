using DoNOF

mol = """
0 1
C    -1.11893   -0.39301    0.06046
C    -1.06962    0.98569   -0.03334
O     1.04352    1.35627   -0.21429
N     1.47853    0.22574    0.22942
C     0.95782   -0.89868   -0.27213
H    -1.24595   -0.86133    1.03067
H    -1.48802   -0.97415   -0.77721
H    -1.09462    1.61015    0.84916
H    -1.26645    1.48844   -0.97026
H     1.75317    0.20428    1.21443
H     0.82090   -0.92013   -1.34318
H     1.22963   -1.82328    0.22628
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13ts_7a"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
