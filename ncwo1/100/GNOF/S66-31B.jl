using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.66457   -0.05023    0.02176
H     1.18169   -0.92122   -0.35547
H     1.27018    0.73677    0.44907
C    -0.66421    0.05036   -0.02749
H    -1.27621   -0.73712   -0.44439
H    -1.17603    0.92143    0.35651
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-31B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
