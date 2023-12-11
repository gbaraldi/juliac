#!/usr/bin/env -S julia --project=@scriptdir

module Main2
function main() :: Cvoid
    # println("Hello, world!")
    a = rand()

    ccall(:puts, Int32, (Ptr{UInt8},), string(a))
    return nothing
end
precompile(main, ())
end