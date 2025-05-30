using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
1 1
N    -0.40705    1.53741    0.00000
N     1.57309    0.41896    0.00000
C    -0.49331   -0.85359    0.00000
C     0.97184   -0.88000    0.00000
C    -1.11158    0.33131    0.00000
C     0.91537    1.56263    0.00000
C    -1.20731   -2.16041    0.00000
O     1.66857   -1.84305    0.00000
O     1.62859    2.64425    0.00000
H    -0.93597    2.39963    0.00000
H     2.59110    0.44239    0.00000
H    -2.18731    0.43978    0.00000
H    -0.93406   -2.74854   -0.87696
H    -0.93406   -2.74854    0.87696
H    -2.28729   -2.02498    0.00000
H     1.14937    3.48274    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-T3"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
