using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
Br   -0.03767   -3.29507    1.77324
C     0.09091   -5.22262    1.86897
H     0.02222   -5.61870    0.86322
H     1.04438   -5.47736    2.31527
H    -0.72585   -5.58760    2.47958
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-27_CH3Br-benB"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
