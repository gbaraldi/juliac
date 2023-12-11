#!/usr/bin/env -S julia --project=@scriptdir

module Main2
Base.@ccallable function main() :: Cvoid
    # println("Hello, world!")
    task = current_task()
    task.rngState0 = 0x5156087469e170ab
    task.rngState1 = 0x7431eaead385992c
    task.rngState2 = 0x503e1d32781c2608
    task.rngState3 = 0x3a77f7189200c20b
    task.rngState4 = 0x5502376d099035ae
    a = rand()
    ccall(:printf, Int32, (Ptr{UInt8},Float64...), "rand: %lf",a)
    return nothing
end
precompile(main, ())
end