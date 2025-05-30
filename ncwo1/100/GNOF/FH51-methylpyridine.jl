using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -1.96213   -1.30462   -1.20527
C    -1.34569   -1.85822   -0.08100
C    -1.52866   -1.22044    1.14547
C    -2.31253   -0.06815    1.19275
C    -2.89286    0.41913    0.01139
N    -2.71534   -0.19655   -1.17518
H    -1.06630   -1.61204    2.05296
H    -1.84500   -1.77389   -2.18697
H    -0.74076   -2.76082   -0.16910
H    -2.47385    0.45617    2.13622
C    -3.75580    1.65306    0.00358
H    -3.68023    2.20987    0.94633
H    -3.46956    2.30993   -0.82884
H    -4.81096    1.37982   -0.15211
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-methylpyridine"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
