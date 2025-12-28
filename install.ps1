# install visual studio community
winget install Microsoft.VisualStudio.Community

# Zen-Browser
winget install Zen-Team.Zen-Browser

# Wezterm
winget install wez.wezterm

# Zed
# winget install ZedIndustries.Zed

# add scoop buckets
scoop bucket add main
scoop bucket add extras
scoop bucket add versions

# install scoop packages
scoop install ripgrep fd fzf bat neovim
scoop install llvm rustup python nodejs deno
scoop install meson ninja cmake
# scoop install ffmpeg imagemagick
scoop install btop yazi
scoop install nmap
