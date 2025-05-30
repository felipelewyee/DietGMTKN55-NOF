using DoNOF

mol = """
0 1
C    -1.39701   -0.04895    0.48578
H    -1.58635    0.70400    1.25155
O    -2.68241   -0.42403   -0.00430
C    -0.50862    0.52941   -0.60818
H    -0.31013   -0.24631   -1.35105
H    -1.06367    1.32430   -1.10894
C     0.82043    1.08185   -0.08755
H     0.63515    1.87686    0.64112
H     1.36370    1.54496   -0.91641
H    -2.54790   -1.13517   -0.63661
H    -0.90980   -0.90019    0.96837
C     1.71969    0.03507    0.56486
H     2.66085    0.49895    0.87443
H     1.25218   -0.37448    1.45833
O     1.96414   -1.08910   -0.27845
H     2.44519   -0.77220   -1.04815
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B39"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
