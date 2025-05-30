using DoNOF

mol = """
0 1
C    -4.41280   -1.92012   -0.05493
H    -4.15091   -2.98613   -0.07030
H    -3.99789   -1.45767   -0.96533
H    -5.50858   -1.84999   -0.11931
C    -3.89805   -1.20474    1.20370
H    -4.29403   -1.74402    2.08581
C    -2.35078   -1.23902    1.31116
H    -1.95480   -0.70020    0.42877
C    -1.83591   -0.52307    2.56941
H    -2.25106   -0.98481    3.48005
H    -0.74016   -0.59353    2.63393
H    -2.09742    0.54305    2.58410
C    -4.45441    0.22711    1.23842
H    -4.23132    0.74415    2.18116
H    -4.03529    0.82950    0.41600
H    -5.54780    0.22109    1.11870
C    -1.79456   -2.67094    1.27712
H    -0.70112   -2.66495    1.39644
H    -2.21343   -3.27276    2.10007
H    -2.01803   -3.18856    0.33478
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-dimethylbutane"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
