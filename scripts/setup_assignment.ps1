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

# Django extensions, JupyterLab, ipykernel 설치
# - django-extensions: shell_plus 같은 편의 명령 사용
# - jupyterlab: 브라우저에서 노트북 환경 사용
# - ipykernel: 현재 venv를 Jupyter 커널로 등록하기 위해 필요
& .\venv\Scripts\python.exe -m pip install django-extensions jupyterlab ipykernel
& .\venv\Scripts\python.exe -m ipykernel install --user --name $repoName --display-name "Python ($repoName)"

Write-Host ""
Write-Host "Setup complete"
Write-Host "Run the following commands:"
Write-Host "\venv\Scripts\activate"