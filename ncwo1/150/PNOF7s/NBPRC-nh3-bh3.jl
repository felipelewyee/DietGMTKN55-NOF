using DoNOF

mol = """
0 1
N     0.00000    0.00000    0.72071
B     0.00000    0.00000   -0.91698
H     0.00000    0.94664    1.08347
H    -0.81981   -0.47332    1.08347
H     0.81981   -0.47332    1.08347
H    -1.01189    0.58422   -1.23684
H     1.01189    0.58422   -1.23684
H     0.00000   -1.16843   -1.23684
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "NBPRC-nh3-bh3"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
