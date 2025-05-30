using DoNOF

mol = """
0 1
O    -2.23154   -0.01849    0.00000
H    -1.31099    0.25907    0.00000
H    -2.73553    0.79549    0.00000
Si    1.46653   -0.05477    0.00000
H     2.40577   -0.49065   -1.09013
H     2.40577   -0.49065    1.09013
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-3O"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
