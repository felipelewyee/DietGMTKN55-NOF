using DoNOF

mol = """
0 1
C     0.46899    0.63687    0.05326
H     0.58541    1.71691    0.03732
C     1.51554   -0.28589   -0.03095
H     1.54258   -1.06230    0.72900
H     0.30100   -1.07560   -0.41197
H     2.49877   -0.00226   -0.39553
S    -1.05218   -0.10517   -0.00579
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts9"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
