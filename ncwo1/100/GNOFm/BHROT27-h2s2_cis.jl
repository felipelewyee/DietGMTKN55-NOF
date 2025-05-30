using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
S     1.05723    0.00000   -0.66228
S    -1.05723    0.00000   -0.66228
H     1.20932    0.00000    0.66271
H    -1.20932    0.00000    0.66271
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-h2s2_cis"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
