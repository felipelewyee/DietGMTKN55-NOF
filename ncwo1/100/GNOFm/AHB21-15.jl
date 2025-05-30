using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
-1 1
S     0.77161    1.32627   -0.93872
H    -0.19075    1.84274   -1.71748
N    -1.14955   -0.03994    1.59774
H    -0.79939   -0.99197    1.58884
H    -0.71315    0.39770    2.40214
H    -0.70067    0.40810    0.78463
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-15"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
