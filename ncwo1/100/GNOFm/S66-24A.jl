using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
0 1
C     0.83123    1.11519    0.07878
H     1.47643    1.98059    0.14598
C     1.37682   -0.16506    0.14248
H     2.44354   -0.29290    0.26499
C     0.54547   -1.28033    0.06089
H     0.96903   -2.27424    0.11299
C    -0.83099   -1.11588   -0.08207
H    -1.47587   -1.98208   -0.14547
C    -1.37694    0.16525   -0.14330
H    -2.44519    0.29342   -0.25546
C    -0.54524    1.28084   -0.06516
H    -0.96831    2.27520   -0.11464
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-24A"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
