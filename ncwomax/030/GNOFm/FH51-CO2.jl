using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C    -1.27367    0.17615    0.21673
O    -0.10241    0.17615    0.21733
O    -2.44505    0.17615    0.21733
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-CO2"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=nothing,do_hfidr=false,do_m_diagnostic=true)
