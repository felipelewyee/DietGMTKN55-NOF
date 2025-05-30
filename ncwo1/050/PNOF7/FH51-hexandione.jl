using DoNOF

mol = """
0 1
C    -6.43818    0.02151    0.53153
H    -6.53999   -0.08669   -0.56004
H    -6.44442    1.10242    0.74135
H    -7.27689   -0.47678    1.02932
C    -5.12716   -0.57992    0.97658
C    -3.85937    0.16576    0.52847
H    -3.04772   -0.56709    0.44006
H    -4.02867    0.68422   -0.42369
C    -3.52715    1.22582    1.59281
C    -2.58001    0.78019    2.68898
H    -1.61433    0.54755    2.20369
H    -2.94610   -0.19633    3.05359
C    -2.40550    1.78857    3.81884
H    -3.36271    1.99143    4.31718
H    -1.70027    1.40812    4.56998
H    -2.02561    2.74556    3.43894
O    -5.05127   -1.57136    1.68171
O    -4.04032    2.33109    1.55546
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-hexandione"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
