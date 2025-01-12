set-alias vim nvim
set-alias vi nvim
set-alias sudo gsudo
set-alias which where.exe

function clenv {
    & "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" amd64
}

function prompt {
    "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}

