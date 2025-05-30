using DoNOF

mol = """
-1 1
H    -0.09139   -0.24481    0.01308
H     1.52727    0.33831    0.65255
O    -1.22084   -0.23562    0.06131
O     1.24621   -0.22061   -0.07714
H    -1.46126    0.36273   -0.64981
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WATER27-OHmH2O"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
