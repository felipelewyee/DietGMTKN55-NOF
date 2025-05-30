using DoNOF

mol = """
1 1
Si   -0.00570    1.59116   -0.00044
Si    0.00570   -1.59116   -0.00044
H     1.42729    1.84563   -0.05758
H    -0.67352    1.84341    1.26837
H    -0.77203    1.83261   -1.21469
H     0.67352   -1.84341    1.26837
H     0.77203   -1.83261   -1.21469
H    -1.42729   -1.84563   -0.05758
H     0.00000    0.00000    0.00869
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-si2h6p"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
