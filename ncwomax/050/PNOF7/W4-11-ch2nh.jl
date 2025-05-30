using DoNOF

mol = """
0 1
C     0.05658    0.58765    0.00000
N     0.05658   -0.68651    0.00000
H    -0.90231   -1.03426    0.00000
H    -0.84382    1.20459    0.00000
H     1.01054    1.10932    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-ch2nh"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
