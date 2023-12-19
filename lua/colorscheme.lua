--local colorscheme = 'monokai_pro'
local colorscheme = 'ofirkai-darkblue'
--local colorscheme = 'peaksea_new'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
