using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 2
C     1.59360   -0.25583    0.00000
C     0.11784    0.00167    0.00000
C    -0.27847    0.79453   -1.26018
C    -0.63710   -1.35385    0.00000
C    -0.27847    0.79453    1.26018
H     2.12366   -0.43641    0.92776
H     2.12366   -0.43641   -0.92776
H    -0.00551    0.24940   -2.16765
H    -1.35737    0.97005   -1.28640
H     0.22365    1.76450   -1.28643
H    -1.71923   -1.18872    0.00000
H    -0.38353   -1.94371   -0.88378
H    -0.38353   -1.94371    0.88378
H    -1.35737    0.97005    1.28640
H    -0.00551    0.24940    2.16765
H     0.22365    1.76450    1.28643
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P45"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
