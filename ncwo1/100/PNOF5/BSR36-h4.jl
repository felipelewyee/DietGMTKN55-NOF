using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.29678    0.12840   -2.55975
C     0.44555   -0.63766   -1.25065
C     0.11514    0.17749    0.00000
C     0.44555   -0.63766    1.25065
C     0.29678    0.12840    2.55975
C    -1.33995    0.63350    0.00000
H     0.89151    1.04212   -2.54128
H     0.63440   -0.47099   -3.40386
H    -0.73764    0.40730   -2.75035
H     1.47251   -1.00034   -1.16403
H    -0.19401   -1.52536   -1.26673
H     0.75694    1.06641    0.00000
H     1.47251   -1.00034    1.16403
H    -0.19401   -1.52536    1.26673
H     0.89151    1.04212    2.54128
H     0.63440   -0.47099    3.40386
H    -0.73764    0.40730    2.75035
H    -2.00392   -0.23389    0.00000
H    -1.57321    1.23477   -0.87655
H    -1.57321    1.23477    0.87655
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BSR36-h4"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
