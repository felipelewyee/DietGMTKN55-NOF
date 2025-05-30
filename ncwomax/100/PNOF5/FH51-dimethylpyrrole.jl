using DoNOF

mol = """
0 1
C    -1.56254   -0.82928   -0.00076
C    -0.17866   -0.81040   -0.00046
C     0.24283    0.55299   -0.00039
C    -0.88881    1.34949   -0.00060
N    -1.97407    0.49150   -0.00085
H    -2.94188    0.79080   -0.00080
H     0.45965   -1.68909   -0.00008
H     1.26579    0.91783   -0.00019
C    -1.05118    2.83360    0.00001
H    -1.59450    3.19619   -0.88846
H    -1.59503    3.19514    0.88859
H    -0.06492    3.31389    0.00061
C    -2.53418   -1.96259    0.00033
H    -3.18726   -1.95336    0.88886
H    -3.18700   -1.95567   -0.88842
H    -1.99149   -2.91595    0.00167
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-dimethylpyrrole"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
