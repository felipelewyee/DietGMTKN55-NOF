using DoNOF

mol = """
1 1
C    -1.45086    0.01703   -0.06070
C    -0.78863    0.01276   -1.27317
C     0.59488    0.00199   -1.26185
C     1.28716   -0.00555   -0.05597
C     0.59332   -0.00143    1.14883
C    -0.79267    0.01044    1.15251
N    -2.92837    0.00320   -0.06370
H    -3.30983    0.48439   -0.88351
H    -3.31422    0.47309    0.76049
H    -1.32096    0.01849   -2.21834
H     1.14440    0.00358   -2.19487
C     2.78272   -0.01205   -0.11709
H     1.12259   -0.00246    2.09223
H    -1.32875    0.01456    2.09556
O     3.33191   -0.02970    1.08751
O     3.38604   -0.00348   -1.14778
H     4.29538   -0.03375    1.01138
H    -3.30412   -0.95110   -0.07152
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-aminocoohbz1"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
