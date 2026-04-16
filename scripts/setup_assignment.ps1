param(
    [Parameter(Mandatory=$true)]
    [string]$RepoUrl
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$gitignoreTemplate = Join-Path $scriptDir "django_gitignore_template.txt"

$repoName = [System.IO.Path]::GetFileNameWithoutExtension($RepoUrl.Split('/')[-1])

git clone $RepoUrl
Set-Location $repoName

if (Test-Path $gitignoreTemplate) {
    Copy-Item $gitignoreTemplate ".gitignore" -Force
}

python -m venv venv

& .\venv\Scripts\python.exe -m pip install --upgrade pip

if (Test-Path "requirements.txt") {
    & .\venv\Scripts\python.exe -m pip install -r requirements.txt
}

# & .\venv\Scripts\python.exe -m pip install notebook

Write-Host ""
Write-Host "Setup complete"
Write-Host "Run the following commands:"
Write-Host "\venv\Scripts\activate"