
local present, null_ls = pcall(require, "null-ls")

if not present then
  print("null_ls error")
   return
end

local b = null_ls.builtins

local sources = {

   -- webdev stuff
   b.formatting.deno_fmt,
   b.formatting.prettierd,
   b.formatting.clang_format,

   -- Lua
   b.formatting.stylua,

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
    b.diagnostics.eslint_d.with({ -- js/ts linter
      condition = function(utils)
        return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
      end,
    }),
  }


null_ls.setup {
   debug = true,
   sources = sources,
}
