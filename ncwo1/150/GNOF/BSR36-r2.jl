using DoNOF

mol = """
0 1
C     1.25759    0.72607    0.23497
C    -1.25759    0.72607    0.23497
C     0.00000   -1.45214    0.23497
C     1.25759   -0.72607   -0.23497
C    -1.25759   -0.72607   -0.23497
C     0.00000    1.45214   -0.23497
H     2.15015    1.24139   -0.12286
H     1.29511    0.74773    1.32818
H    -2.15015    1.24139   -0.12286
H    -1.29511    0.74773    1.32818
H     0.00000   -1.49546    1.32818
H     0.00000   -2.48278   -0.12286
H     1.29511   -0.74773   -1.32818
H     2.15015   -1.24139    0.12286
H    -1.29511   -0.74773   -1.32818
H    -2.15015   -1.24139    0.12286
H     0.00000    2.48278    0.12286
H     0.00000    1.49546   -1.32818
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BSR36-r2"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
