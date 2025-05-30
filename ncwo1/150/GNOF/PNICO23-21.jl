using DoNOF

mol = """
0 1
N     2.96258   -0.20289    0.00000
H     3.32442    0.27747    0.81341
H     3.32442    0.27747   -0.81341
H     3.35877   -1.13364    0.00000
P     0.00000    0.25957    0.00000
H     0.24760   -0.66008   -1.04178
H     0.24760   -0.66008    1.04178
C    -1.78500   -0.00879    0.00000
N    -2.93299   -0.07454    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-21"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
