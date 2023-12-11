cmd = Base.julia_cmd()

cflags = readchomp(`$(cmd) $(joinpath(Sys.BINDIR, Base.DATAROOTDIR,"julia", "julia-config.jl")) --cflags `)
allflags = readchomp(`$(cmd) $(joinpath(Sys.BINDIR, Base.DATAROOTDIR,"julia", "julia-config.jl")) --allflags`)

img_path = joinpath(@__DIR__, "img.a")
bc_path = joinpath(@__DIR__, "img-bc.a")
run(`$cmd --output-o $img_path --output-incremental=no --strip-ir --strip-metadata compile.jl`)
# run(`$cmd --output-bc $bc_path -g2 --output-incremental=no  compile.jl`)
# run(`cc $(Cmd(String.(split(cflags)))) -c -o init.a init.c `)
run(`cc -std=gnu11 -I'/Users/gabrielbaraldi/julia2/usr/include/julia' -g -fPIC -c -o init.a init.c`)

run(`cc -std=gnu11 -I'/Users/gabrielbaraldi/julia2/usr/include/julia' -g  -fPIC -L'/Users/gabrielbaraldi/julia2/usr/lib' -Wl,-rpath,'/Users/gabrielbaraldi/julia2/usr/lib' -ljulia -ljulia-internal -o ./test-o $(Base.Linking.WHOLE_ARCHIVE) img.a $(Base.Linking.NO_WHOLE_ARCHIVE) init.a`)
# run(`cc $(allflags) -o ./test-o img.a init.a`)