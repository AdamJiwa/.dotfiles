set-alias vim nvim
set-alias vi nvim
set-alias sudo gsudo
set-alias which where.exe
$env:XDG_CONFIG_HOME="~/.config"

function clenv {
    & "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" amd64
}

function prompt {
    "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}

function espenv {
    D:/Espressif/v5.4/esp-idf/export.ps1
}

