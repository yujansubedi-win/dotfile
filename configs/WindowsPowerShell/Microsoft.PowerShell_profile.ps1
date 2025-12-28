# Env vars
$env:PAGER="bat"
$env:CC="clang"
$env:CXX="clang++"

# PSReadLine Options
Set-PSReadlineOption -BellStyle None -EditMode Vi -Colors @{
	Command = "DarkCyan"
	String = "Yellow"
	Number = "Magenta"
	Variable = "Green"
	Keyword = "Blue"
	Comment = "DarkGray"
	Operator = "White"
}

# Tab completions and history search
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# alias
function gitlog {git log --graph --parents --all --decorate --oneline}
function mesonsetup {meson setup build --reconfigure}
function mesoncompile {meson compile -C build}
function nc {ncat}
function vi {nvim --noplugin}
function vim {nvim --noplugin}
function fz {fzf --height=85% --layout=reverse}
function fzp {fz --preview 'bat --style=numbers --color=always {}'}
function fzfp {fzf --preview 'bat --style=numbers --color=always {}'}
function hisr {history | fz}
function his {history | fz --tac}
function lf {yazi}

function fcd {
	Set-Location "~/source/repos/"
	$folderPath = fd -t d | fzf
	if ($folderPath) {
		Set-Location $folderPath
	}
}

function ncd {
	Set-Location "~/source/repos/"
	$folderPath = fd -t d | fzf
	if ($folderPath) {
		Set-Location $folderPath
		nvim .
	}
}

# control+d to exit
Set-PSReadLineKeyHandler -Chord Ctrl+d -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert('exit')
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

# control+n to nvim .
Set-PSReadLineKeyHandler -Chord Ctrl+n -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert('nvim .')
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

# alt+n to ncd
Set-PSReadLineKeyHandler -Chord ALT+n -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert('ncd')
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

# Prompt style
function Get-GitBranch {
	$gitBranch = git rev-parse --abbrev-ref HEAD 2>$null
	if ($gitBranch) {
		$gitStatus = git status --short 2>$null
		$statusIndicator = if ($gitStatus) { "*" } else { "" }
		Write-Host " -> git:(" -NoNewline -ForegroundColor Cyan
		Write-Host "$gitBranch" -NoNewline -ForegroundColor DarkGreen
		Write-Host "$statusIndicator" -NoNewline -ForegroundColor Red
		Write-Host ")" -NoNewline -ForegroundColor Cyan
	}
}

function Prompt {
	$lastSuccess = $?

	Write-Host " (" -NoNewline
	Write-Host "$env:USERNAME" -NoNewline
	Write-Host "):[" -NoNewline
	Write-Host "$($executionContext.SessionState.Path.CurrentLocation)" -NoNewline -ForegroundColor DarkGreen
	Write-Host "]" -NoNewline
	Get-GitBranch

	Write-Host ""
	if ($lastSuccess) {
		Write-Host " x" -NoNewline -ForegroundColor Red
	} else {
		Write-Host " x" -NoNewline -ForegroundColor DarkGray
	}
	return " "
}
