using DoNOF

mol = """
0 1
C    -1.35901   -0.17717   -0.45405
H    -0.83732   -1.11727   -0.61448
O    -2.57482   -0.51352    0.20763
C    -0.49895    0.78904    0.35586
H    -1.04890    1.72815    0.45979
H    -0.37647    0.39142    1.36749
C     0.87083    1.05514   -0.28590
H     1.20038    2.07071   -0.05378
H     0.78857    0.99118   -1.37383
H    -3.08056    0.29714    0.31083
H    -1.55623    0.25445   -1.44121
C     1.96633    0.10542    0.18797
H     2.89630    0.32679   -0.33409
H     2.14337    0.25555    1.25772
O     1.68952   -1.26806   -0.08161
H     1.07811   -1.58001    0.59012
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B64"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
