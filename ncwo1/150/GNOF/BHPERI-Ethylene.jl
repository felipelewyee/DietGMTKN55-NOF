using DoNOF

mol = """
0 1
C     0.66552    0.00000    0.00000
C    -0.66552    0.00000    0.00000
H     1.23945   -0.92356    0.00000
H     1.23945    0.92356    0.00000
H    -1.23945   -0.92356    0.00000
H    -1.23945    0.92356    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-Ethylene"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
