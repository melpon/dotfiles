$vswhere = "$Home\.vswhere\vswhere.exe"

if (!(Test-Path $vswhere)) {
  New-Item "$Home\.vswhere" -Type Directory -ErrorAction Ignore
  Invoke-WebRequest -Uri 'https://github.com/microsoft/vswhere/releases/download/3.0.1/vswhere.exe' -OutFile "$vswhere"
}

if (Test-Path $vswhere) {
  $vspath = & $vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath
  $(cmd /c "call `"$vspath\VC\Auxiliary\Build\vcvars64.bat`" & set") | Foreach-Object {
    if ($_ -match "^(.*?)=(.*)$") {
      Set-Content "env:\$($matches[1])" $matches[2]
    }
  }
}
