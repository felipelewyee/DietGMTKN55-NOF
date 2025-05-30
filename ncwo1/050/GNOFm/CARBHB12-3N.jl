using DoNOF

mol = """
0 1
N    -2.02182    0.03843   -0.13709
H    -1.05692    0.34213   -0.15347
H    -2.58897    0.87369   -0.17721
H    -2.17994   -0.37485    0.77106
Si    1.99386    0.01385   -0.05021
H     2.87433   -0.37134   -1.20958
H     2.97945   -0.52190    0.95650
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-3N"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
