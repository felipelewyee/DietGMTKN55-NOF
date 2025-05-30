using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -0.00000    0.00000    0.76326
C    -0.00000   -0.00000   -0.76326
H    -0.88069    0.50846    1.15784
H     0.00000   -1.01693    1.15784
H     0.88069    0.50846    1.15784
H     0.88069   -0.50846   -1.15784
H    -0.88069   -0.50846   -1.15784
H     0.00000    1.01693   -1.15784
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-c2h6"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
