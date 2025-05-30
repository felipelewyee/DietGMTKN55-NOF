using DoNOF

mol = """
0 1
N    -1.03060   -0.43232    0.00000
C    -1.81252    0.68361    0.00000
N    -1.08641    1.78101    0.00000
C     0.21700    1.34408    0.00000
C     0.28336   -0.02851    0.00000
C     1.42752   -0.97880    0.00000
H     1.04217    2.03503    0.00000
H    -2.88733    0.63545    0.00000
H     1.42152   -1.61814   -0.88237
H     2.35938   -0.42031    0.00000
H     1.42152   -1.61814    0.88237
H    -1.35561   -1.38296    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-8b"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
