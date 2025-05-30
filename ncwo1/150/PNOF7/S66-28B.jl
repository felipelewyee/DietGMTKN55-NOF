using DoNOF

mol = """
0 1
N    -0.48155    1.18127   -0.27190
H    -0.85486    2.08303   -0.53479
C     0.91060    1.10828   -0.13989
O     1.60151    2.10271   -0.28472
C     1.38950   -0.22580    0.17822
H     2.44655   -0.37801    0.31235
C     0.50979   -1.24018    0.30444
H     0.81572   -2.24860    0.54097
N    -0.83546   -1.05514    0.13435
H    -1.48420   -1.81770    0.23322
C    -1.40990    0.16966   -0.16507
O    -2.60769    0.32048   -0.30718
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-28B"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
