using DoNOF

mol = """
0 1
C     0.74005    1.16129   -0.21695
H     1.31408    2.06241   -0.38452
C     1.38595   -0.07118   -0.13091
H     2.46137   -0.12644   -0.23038
C     0.64590   -1.23236    0.08570
H     1.14719   -2.18783    0.15653
C    -0.74013   -1.16147    0.21421
H    -1.31367   -2.06322    0.38052
C    -1.38617    0.07086    0.12941
H    -2.46157    0.12668    0.23032
C    -0.64604    1.23248   -0.08534
H    -1.14697    2.18878   -0.14859
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-47A"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
