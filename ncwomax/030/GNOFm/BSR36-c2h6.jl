using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.00000    0.00000   -0.76169
C     0.00000    0.00000    0.76169
H    -0.87860    0.50726   -1.15577
H     0.00000   -1.01452   -1.15577
H     0.87860    0.50726   -1.15577
H    -0.87860   -0.50726    1.15577
H     0.00000    1.01452    1.15577
H     0.87860   -0.50726    1.15577
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BSR36-c2h6"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=nothing,do_hfidr=false,do_m_diagnostic=true)
