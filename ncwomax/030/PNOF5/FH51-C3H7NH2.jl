using DoNOF

mol = """
0 1
C    -4.92154   -0.93537    0.03408
H    -4.51206   -1.95245   -0.06281
H    -4.69548   -0.39718   -0.89893
H    -6.01430   -1.02344    0.10938
C    -4.33629   -0.20928    1.24713
H    -4.77036    0.79879    1.33918
H    -4.61260   -0.74995    2.16958
C    -2.81462   -0.07731    1.18723
H    -2.53610    0.48335    0.27949
H    -2.37057   -1.08992    1.07981
N    -2.30898    0.67368    2.34644
H    -2.49569    0.15108    3.20594
H    -1.29383    0.77577    2.28815
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C3H7NH2"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
