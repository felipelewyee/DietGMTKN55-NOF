using DoNOF

mol = """
0 1
N    -1.04378   -0.09487    0.00000
H    -0.65570   -1.04048    0.00000
H    -0.65568    0.37797    0.81892
H    -0.65568    0.37797   -0.81892
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-NH3"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
