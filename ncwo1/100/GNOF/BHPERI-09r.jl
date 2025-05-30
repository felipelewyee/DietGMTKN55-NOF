using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -0.71355    0.00000   -0.69977
C    -1.24099    0.00000    0.55889
S     0.00000    0.00000    1.76914
C     1.24099    0.00000    0.55889
C     0.71355    0.00000   -0.69977
H    -1.31814    0.00000   -1.59706
H    -2.27882    0.00000    0.85336
H     2.27882    0.00000    0.85336
H     1.31814    0.00000   -1.59706
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-09r"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
