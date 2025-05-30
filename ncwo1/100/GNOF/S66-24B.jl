using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.83091    1.11592    0.08259
H     1.47575    1.98210    0.14634
C     1.37686   -0.16523    0.14411
H     2.44507   -0.29338    0.25685
C     0.54521   -1.28083    0.06546
H     0.96829   -2.27519    0.11511
C    -0.83119   -1.11520   -0.07926
H    -1.47629   -1.98061   -0.14689
C    -1.37675    0.16503   -0.14322
H    -2.44338    0.29286   -0.26640
C    -0.54547    1.28031   -0.06115
H    -0.96900    2.27422   -0.11352
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-24B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
