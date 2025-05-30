using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.00000    2.53300    0.30166
C     0.00000    1.27183   -0.55188
C     0.00000    0.00000    0.28528
C     0.00000   -1.27183   -0.55188
C     0.00000   -2.53300    0.30166
H     0.00000    3.43387   -0.30989
H     0.87444   -1.26924   -1.20654
H    -0.87444   -1.26924   -1.20654
H     0.87963    2.56514    0.94437
H    -0.87963    2.56514    0.94437
H    -0.87513    0.00000    0.94180
H     0.87513    0.00000    0.94180
H    -0.87444    1.26924   -1.20654
H     0.87444    1.26924   -1.20654
H     0.00000   -3.43387   -0.30989
H     0.87963   -2.56514    0.94437
H    -0.87963   -2.56514    0.94437
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ACONF-P_TT"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
