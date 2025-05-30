using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N    -0.42215    0.81422   -0.02203
H    -0.05153    1.32199    0.77110
H    -0.05141    1.27855   -0.84129
C     0.05560   -0.57182    0.01543
H    -0.33629   -1.10584   -0.84676
H     1.14231   -0.67855    0.01847
H    -0.33653   -1.05855    0.90507
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-06B"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=nothing,do_hfidr=false,do_m_diagnostic=true)
