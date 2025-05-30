using DoNOF

mol = """
0 2
C    -2.00696    0.00228    0.40532
C    -0.77127    0.01445   -0.36066
N     0.38850    0.03819    0.37515
O    -0.75932    0.01468   -1.59140
H     0.33537   -0.04828    1.37604
C     1.69080   -0.00168   -0.26293
H    -2.02520    0.00409    1.48819
H    -2.93897   -0.00832   -0.13973
H     1.70685    0.69066   -1.10436
H     1.92919   -0.99934   -0.64541
H     2.45102    0.29326    0.45979
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P16"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
