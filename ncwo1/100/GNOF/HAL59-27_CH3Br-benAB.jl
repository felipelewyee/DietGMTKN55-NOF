using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
H     0.00771    0.21428    0.05233
C     0.01039    0.20047    1.13364
C     1.21788    0.24617    1.82843
C     1.22126    0.22318    3.22170
C     0.01750    0.15443    3.92053
C    -1.18979    0.10838    3.22622
C    -1.19362    0.13142    1.83274
H     2.15205    0.29483    1.28581
H     2.15836    0.25518    3.76058
H     0.02047    0.13328    5.00177
H    -2.12373    0.05063    3.76836
H    -2.13014    0.09089    1.29351
Br   -0.03767   -3.29507    1.77324
C     0.09091   -5.22262    1.86897
H     0.02222   -5.61870    0.86322
H     1.04438   -5.47736    2.31527
H    -0.72585   -5.58760    2.47958
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-27_CH3Br-benAB"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
