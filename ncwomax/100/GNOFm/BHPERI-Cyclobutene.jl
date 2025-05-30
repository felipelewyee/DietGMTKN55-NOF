using DoNOF

mol = """
0 1
H     0.00000   -1.42064    1.71660
C     0.00000    0.67017    0.92994
C     0.00000   -0.67017    0.92994
C     0.00000    0.78631   -0.58458
C     0.00000   -0.78631   -0.58458
H     0.89011   -1.24660   -1.03098
H    -0.89011   -1.24660   -1.03098
H     0.00000    1.42064    1.71660
H    -0.89011    1.24660   -1.03098
H     0.89011    1.24660   -1.03098
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-Cyclobutene"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
