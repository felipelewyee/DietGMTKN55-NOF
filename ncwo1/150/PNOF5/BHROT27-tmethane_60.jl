using DoNOF

mol = """
0 1
C    -0.00687    0.77026    0.41444
C     0.00687   -0.77026    0.41444
C     1.40791   -1.32508    0.64060
H    -0.61080   -1.08811    1.25682
C    -0.60037   -1.35755   -0.85382
C    -1.40791    1.32508    0.64060
C     0.60037    1.35755   -0.85382
H     0.61080    1.08811    1.25682
H     1.38478   -2.39936    0.81272
H     2.04486   -1.14928   -0.22434
H     1.88180   -0.86164    1.50288
H     0.05015   -1.18136   -1.70797
H    -0.73465   -2.43274   -0.76120
H    -1.57086   -0.92077   -1.08014
H     0.73465    2.43274   -0.76120
H     1.57086    0.92077   -1.08014
H    -0.05015    1.18136   -1.70797
H    -1.38478    2.39936    0.81272
H    -2.04486    1.14928   -0.22434
H    -1.88180    0.86164    1.50288
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-tmethane_60"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
