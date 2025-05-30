using DoNOF

mol = """
0 1
N     2.24501   -0.35409   -0.11633
C     0.87817   -0.36491   -0.05680
C     0.51438    0.98336   -0.07559
N     1.62016    1.80495   -0.14527
C     2.62803    0.96398   -0.16842
C    -0.86504    1.20802   -0.01212
N    -1.70675    0.19417    0.05060
C    -1.20927   -1.06470    0.05291
N     0.07027   -1.42433    0.00951
O    -1.35588    2.45125   -0.01010
N    -2.14569   -2.06592    0.05743
H     3.66531    1.24727   -0.22260
H    -3.05550   -1.80472    0.39090
H    -1.80770   -2.96845    0.33868
H    -2.31644    2.35730    0.03342
H     2.84095   -1.16318   -0.12623
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-6a"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
