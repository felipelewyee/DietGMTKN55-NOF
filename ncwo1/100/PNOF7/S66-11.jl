using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
N    -2.49041   -0.00335   -0.38653
H    -1.78982   -0.25632   -1.07525
H    -3.38195   -0.29081   -0.76806
C    -2.22621   -0.75202    0.84116
H    -2.97785   -0.50346    1.58833
H    -2.20872   -1.84002    0.72721
H    -1.26024   -0.44922    1.24261
C     0.33619    1.87237   -0.63696
H     0.46081    2.28355   -1.63600
H     0.84276    2.51337    0.08082
H    -0.73022    1.84584   -0.41854
C     0.84818    0.45458   -0.63467
O     0.38820   -0.41116   -1.37384
N     1.83467    0.18154    0.25767
H     2.23443    0.93648    0.78302
C     2.42311   -1.13805    0.33516
H     1.63494   -1.87938    0.24214
H     3.14437   -1.31004   -0.46338
H     2.91777   -1.25392    1.29510
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-11"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
