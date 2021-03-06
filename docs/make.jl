using Documenter, LineSearches

# Generate examples
include("generate.jl")

GENERATEDEXAMPLES = [joinpath("examples", "generated", f) for f in (
    "customoptimizer.md", "optim_linesearch.md", "optim_initialstep.md")]

# Build documentation.
makedocs(
    format = :html,
    sitename = "LineSearches.jl",
    doctest = false,
    # strict = VERSION.minor == 6 && sizeof(Int) == 8, # only strict mode on 0.6 and Int64
    strict = false,
    pages = Any[
        "Home" => "index.md",
        "Examples" => GENERATEDEXAMPLES,
        "API Reference" => [
            "reference/linesearch.md",
            "reference/initialstep.md",
            ]
        ]
    )

# Deploy built documentation from Travis.
deploydocs(
    repo = "github.com/JuliaNLSolvers/LineSearches.jl.git",
    target = "build",
    julia = "0.6", # deploy from release bot
    deps = nothing,
    make = nothing,
)
