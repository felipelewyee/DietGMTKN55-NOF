using DoNOF

mol = """
0 1
C    -0.01877    0.77621    0.18956
C     0.01877   -0.77621    0.18956
C     1.15770   -1.25756    1.07533
H    -0.91396   -1.12109    0.64234
C     0.10786   -1.41617   -1.18532
C    -0.10786    1.41617   -1.18532
H     0.91396    1.12109    0.64234
C    -1.15770    1.25756    1.07533
H     0.01910    2.49187   -1.11305
H     0.65500    1.04140   -1.86189
H    -1.07810    1.22483   -1.64801
H    -0.01910   -2.49187   -1.11305
H    -0.65500   -1.04140   -1.86189
H     1.07810   -1.22483   -1.64801
H     1.18727   -2.34243    1.15248
H     2.11232   -0.92550    0.66727
H     1.06743   -0.84801    2.08036
H    -1.18727    2.34243    1.15248
H    -2.11232    0.92550    0.66727
H    -1.06743    0.84801    2.08036
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-tmethane_120"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
