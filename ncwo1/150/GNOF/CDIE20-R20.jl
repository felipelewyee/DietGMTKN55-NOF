using DoNOF

mol = """
0 1
C     0.00000    0.43744    0.00000
C    -1.38884    0.82640    0.00000
C    -0.49516    1.78772    0.00000
C     0.96338   -0.47044    0.00000
C     0.71722   -1.95179    0.00000
H    -2.42874    0.55266    0.00000
H    -0.29676    2.84486    0.00000
H     1.99156   -0.12856    0.00000
H     1.15276   -2.43685    0.87855
H    -0.35124   -2.17127    0.00000
H     1.15276   -2.43685   -0.87855
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R20"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
