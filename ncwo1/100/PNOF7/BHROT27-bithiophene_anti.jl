using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -1.45953   -1.19106    0.16003
C    -2.84881   -0.96285    0.09932
C    -3.15396    0.32609   -0.20600
S    -1.74976    1.25920   -0.44445
C    -0.71851   -0.07162   -0.10009
C     0.71851    0.07162   -0.10009
S     1.74976   -1.25920   -0.44445
C     3.15396   -0.32609   -0.20600
C     2.84881    0.96285    0.09932
C     1.45953    1.19106    0.16003
H    -1.00997   -2.13399    0.42285
H    -3.59073   -1.71892    0.28987
H    -4.12353    0.77480   -0.31224
H     4.12353   -0.77480   -0.31224
H     3.59073    1.71892    0.28987
H     1.00997    2.13399    0.42285
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-bithiophene_anti"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
