using DoNOF

mol = """
0 1
C    -0.76309    0.00000   -0.00000
C     0.76309    0.00000   -0.00000
H     1.15831   -0.44364   -0.91410
H    -1.15831   -1.01333   -0.07464
H     1.15831   -0.56981    0.84125
H     1.15831    1.01345    0.07285
H    -1.15831    0.44202    0.91488
H    -1.15831    0.57131   -0.84024
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-C2H6"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
