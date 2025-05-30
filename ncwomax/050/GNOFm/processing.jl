f = open("AllElements_050.yaml")

template = """
using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = \"\"\"
xyz\"\"\"

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = \"rrrr\"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
"""

molname = nothing
charge = nothing
mult = nothing
number = nothing
elements = nothing
xyz = nothing
counter = 0
fmol = nothing
for line in readlines(f)
    if startswith(line,"      ") && line[7]!=' ' && !occursin("#",line)
        global molname = replace(line[1:end-1], " " => "")
	global counter = 0
        #println(molname)
    end
    if occursin("Charge",line)
	global charge = split(line)[2]
        #println(charge)
    end
    if occursin("UHF",line) && !occursin("#",line)
        global mult = parse(Int64,split(line)[2]) + 1
        #println(mult)
    end
    if occursin("Number",line)
        global number = parse(Int64,split(line)[2])
	global xyz = ""
        #println(number)
    end
    if occursin("Elements",line)
        global elements = split(line,":")[2][4:end-2]
	global elements = split(elements,", ")
        #println(elements)
    end
    if occursin("- [",line)
	coords = line[14:45]
	#println(line[46])
        #println(coords)
	global counter += 1
	global xyz *= elements[counter] * "    " * replace(coords,"," => " ") * "\n"

	if counter == number
	    open(molname*".jl", "w") do fmol
		xyz = charge * join([" ", mult]) * "\n" * xyz
		content = replace(replace(template, "xyz" => xyz), "rrrr" => molname)
		print(fmol,content)
	    end
        end
    end
	
end
