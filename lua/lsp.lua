require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'clangd', 'lua_ls', 'rust_analyzer' },
    automatic_enable = false,
})

local function clangd_setup()
    local lspconfig = require('lspconfig')

    
    lspconfig.clangd.setup {
        -- Clangd 特定配置
        settings = {
            clangd = {
                -- 配置选项
                fallbackFlags = {
                    "-std=c++17",  -- 默认 C++17 标准
                    "-Wall",       -- 启用常规警告
                    "-Wextra"      -- 启用额外警告
                },
                
                -- 建议配置
                suggests = {
                    autoImport = true,
                    autoInclude = true
                }
            }
        },
        
        -- 命令行参数
        cmd = {
            "clangd",
            "--background-index",           -- 后台索引
            "--suggest-missing-includes",   -- 建议缺失的头文件
            "--clang-tidy",                 -- 启用 clang-tidy
            "--header-insertion=iwyu",      -- 智能头文件插入
            "--completion-style=detailed",  -- 详细补全
            "--enable-config",              -- 启用本地配置文件
            "--j=4"
        },
        
        -- 根据项目类型动态配置
        root_dir = function(fname)
            local root_files = {
                '.clangd',             -- Clangd 配置文件
                '.clang-format',       -- Clang 格式配置
                'compile_commands.json',
                'compile_flags.txt',
                'configure.ac',        -- Autotools 配置
                'CMakeLists.txt',      -- CMake 项目
                '.git'                 -- Git 仓库
            }
            
            return lspconfig.util.root_pattern(unpack(root_files))(fname) 
                or lspconfig.util.find_git_ancestor(fname)
        end
    }
end

-- 初始化 Clangd 配置
clangd_setup()
