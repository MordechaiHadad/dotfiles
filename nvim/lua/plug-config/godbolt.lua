return function()
    require("godbolt").setup({
        rust = { compiler = "r1570", options = { userArguments = "--emit=llvm-ir" } },
    })
end
