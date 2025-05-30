using DoNOF

mol = """
0 1
C    -1.50240    0.49171    0.00000
C     0.00000    0.42262    0.00000
C    -0.50430    1.61540    0.00000
C     1.11534   -0.47240    0.00000
C     0.97987   -1.80021    0.00000
H    -2.04953    0.25683    0.91154
H    -2.04953    0.25683   -0.91154
H    -0.37289    2.68126    0.00000
H     2.10271   -0.02360    0.00000
H    -0.00040   -2.25789    0.00000
H     1.83860   -2.45619    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R21"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
