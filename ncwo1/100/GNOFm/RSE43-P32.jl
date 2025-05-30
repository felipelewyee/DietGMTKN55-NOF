using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 2
C    -0.42634    0.07513    0.00000
O     0.94011    0.18716    0.00000
H     1.36671   -0.67878    0.00000
H    -0.94024    0.20824   -0.94555
H    -0.94024    0.20824    0.94555
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P32"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
