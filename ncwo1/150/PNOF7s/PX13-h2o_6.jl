using DoNOF

mol = """
0 1
O     0.00000    2.69916    0.14085
H     0.84374    2.20172    0.02919
H     2.32861    0.37015   -0.02919
H    -0.11059   -3.23393   -0.93124
H    -0.84374   -2.20172   -0.02919
O     0.00000   -2.69916   -0.14085
O     2.33754    1.34958   -0.14085
H    -1.48487    1.83156   -0.02919
O    -2.33754    1.34958   -0.14085
O     2.33754   -1.34958    0.14085
H     1.48487   -1.83156    0.02919
H     2.74537   -1.71273    0.93124
O    -2.33754   -1.34958    0.14085
H    -2.32861   -0.37015    0.02919
H    -2.85596   -1.52119    0.93124
H     2.85596    1.52119   -0.93124
H     0.11059    3.23393    0.93124
H    -2.74537    1.71273   -0.93124
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-h2o_6"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
