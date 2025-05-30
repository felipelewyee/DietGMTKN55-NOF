using DoNOF

mol = """
0 1
C    -0.28094   -0.50629   -0.42319
C     1.03767    0.38628   -0.51444
C     0.62832   -1.53278    0.23843
C     1.72718   -0.78226    0.16197
H     1.33964    0.51887   -1.55698
C    -1.41714    0.01857    0.38415
H    -1.18934    0.29570    1.40823
C    -2.66101    0.15226   -0.05995
H    -3.45168    0.53607    0.57041
H    -2.93125   -0.12086   -1.07304
H     0.42308   -2.52487    0.61782
H     2.75689   -0.93848    0.45580
C     1.05135    1.73153    0.19204
H     2.04442    2.18081    0.13440
H     0.34245    2.42233   -0.26697
H     0.79371    1.63331    1.24656
H    -0.64057   -0.80673   -1.41034
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P48"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
