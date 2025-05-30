using DoNOF

mol = """
0 1
N     0.11964    1.30318    0.00000
C    -1.21257    1.34635    0.00000
C    -2.02188    0.21463    0.00000
C    -1.40223   -1.02846    0.00000
C    -0.01400   -1.08510    0.00000
C     0.71951    0.10413    0.00000
C     2.22407    0.10727    0.00000
H    -1.65524    2.33809    0.00000
H    -3.10030    0.31034    0.00000
H    -1.98888   -1.93976    0.00000
H     0.49960   -2.03878    0.00000
H     2.63115   -0.90452    0.00000
H     2.60056    0.63631   -0.87842
H     2.60056    0.63631    0.87842
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E21"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
