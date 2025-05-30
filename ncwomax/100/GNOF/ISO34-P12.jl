using DoNOF

mol = """
0 1
C     1.24201    0.66555   -0.58121
C     1.24201   -0.66555   -0.58121
C     0.00000   -1.12165    0.21150
C    -1.24201   -0.66555   -0.58121
C    -1.24201    0.66555   -0.58121
C     0.00000    1.12165    0.21150
C     0.00000    0.00000    1.29566
H     1.93017    1.33334   -1.08006
H     1.93017   -1.33334   -1.08006
H     0.00000   -2.15619    0.54783
H    -1.93017   -1.33334   -1.08006
H    -1.93017    1.33334   -1.08006
H     0.00000    2.15619    0.54783
H     0.89792    0.00000    1.91538
H    -0.89792    0.00000    1.91538
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-P12"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
