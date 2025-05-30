using DoNOF

mol = """
0 1
H     0.02211    0.33772    0.04431
C     0.02692    0.29716    1.12779
C     1.23242    0.37429    1.82321
C     1.23851    0.31830    3.21564
C     0.03945    0.18454    3.91326
C    -1.16622    0.10711    3.21863
C    -1.17298    0.16391    1.82551
H     2.16553    0.47432    1.28031
H     2.17663    0.37513    3.75618
H     0.04472    0.13704    4.99638
H    -2.09886   -0.00056    3.76095
H    -2.11070    0.10160    1.28461
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-28_CH3I-benA"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
