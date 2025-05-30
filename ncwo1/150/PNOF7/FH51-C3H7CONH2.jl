using DoNOF

mol = """
0 1
C     0.59837   -3.23975    4.87068
O     1.38074   -3.14007    5.81061
C    -0.35293   -4.42470    4.71097
H    -1.12478   -4.21329    3.95314
H     0.25118   -5.26169    4.31907
C    -0.99729   -4.84145    6.03810
H    -1.63905   -4.02191    6.40025
H    -0.19812   -4.95794    6.78414
C    -1.81474   -6.12870    5.92066
H    -2.26811   -6.39993    6.88449
H    -2.63018   -6.02669    5.18792
H    -1.18473   -6.97244    5.60015
N     0.53279   -2.29619    3.87887
H     1.18300   -1.51808    3.90833
H    -0.09229   -2.38528    3.08829
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C3H7CONH2"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
