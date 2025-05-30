using DoNOF

mol = """
0 1
H    -0.00633   -0.04085   -0.00818
N     0.99954   -0.00231   -0.00484
N     1.47740    1.34271    0.00557
H     0.71828    2.00421    0.00763
H     2.03340    1.48238   -0.82227
H     1.34771   -0.45865    0.82210
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-n2h4_ecl1"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
