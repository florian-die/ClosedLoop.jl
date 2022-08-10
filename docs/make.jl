using Documenter
using ClosedLoop

makedocs(
    sitename = "ClosedLoop.jl",
    format = Documenter.HTML(prettyurls = false),
    pages = [
        "Introduction" => "index.md",
        "API" => "api.md"
    ]
)

deploydocs(
    repo = "https://github.com/florian-die/ClosedLoop.jl.git",
    devbranch = "master"
)