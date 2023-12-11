ccall(:jl_set_newly_inferred, Cvoid, (Any,), Core.Compiler.newly_inferred)
Core.Compiler.track_newly_inferred.x = true
Base.include(Base.__toplevel__, "test2.jl")

