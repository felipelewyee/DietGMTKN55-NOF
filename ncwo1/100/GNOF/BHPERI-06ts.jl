using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
H    -1.96836    1.06707    1.34307
C    -1.11417    1.01458    0.68422
C     0.22922    0.72933    1.09945
C    -1.11417    1.01458   -0.68422
H     1.98244    0.70630    0.00000
N     1.03478    1.05782    0.00000
C     0.22922   -1.33411    0.70660
H     0.61593    0.86964    2.10019
C     0.22922   -1.33411   -0.70660
H    -1.96836    1.06707   -1.34307
C     0.22922    0.72933   -1.09945
H     0.61593    0.86964   -2.10019
H    -0.65531   -1.66353   -1.23802
H    -0.65531   -1.66353    1.23802
H     1.15484   -1.56502    1.22578
H     1.15484   -1.56502   -1.22578
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-06ts"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
