using DoNOF

mol = """
0 1
N    -0.77907    0.10995    0.00000
N    -0.03150    0.01698    1.22272
N    -0.03150    0.01698   -1.22272
H     0.73808   -0.65953   -1.13085
H     0.38904    0.93052   -1.38897
H     0.73808   -0.65953    1.13085
H     0.38904    0.93052    1.38897
H    -1.41216   -0.68588    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ICONF-N3H5_1"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
