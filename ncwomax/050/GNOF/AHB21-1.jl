using DoNOF

mol = """
-1 1
F    -0.20512    1.19195   -0.69629
N    -1.07147   -0.00913    1.50279
H    -0.61757   -0.91698    1.47415
H    -0.60090    0.48688    2.25356
H    -0.76307    0.48318    0.60817
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-1"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
