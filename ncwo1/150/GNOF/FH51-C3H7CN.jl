using DoNOF

mol = """
0 1
C    -4.04121   -0.49930    0.00306
H    -3.69618   -1.54341   -0.02932
H    -3.69731   -0.00418   -0.91727
H    -5.13932   -0.51084   -0.01535
C    -3.52625    0.22021    1.24982
H    -3.90253    1.25365    1.27735
H    -3.90264   -0.27289    2.15833
C    -1.98393    0.24911    1.30066
H    -1.58271   -0.77757    1.28999
H    -1.58259    0.75193    0.40568
C    -1.46554    0.93226    2.48242
N    -1.07612    1.48085    3.43094
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C3H7CN"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
