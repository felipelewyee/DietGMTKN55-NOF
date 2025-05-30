using DoNOF

mol = """
0 1
C     0.66619    0.00077    0.00034
H     1.22868   -0.51293    0.76687
H     1.22783    0.51417   -0.76700
C    -0.66618   -0.00007    0.00022
H    -1.22813   -0.51454    0.76671
H    -1.22839    0.51260   -0.76714
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-44A"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
