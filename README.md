# Django Assignment Setup Script

SSAFY Django 과제를 시작할 때 반복적으로 하게 되는 초기 세팅 작업을 자동화하기 위한 PowerShell 스크립트입니다.

## What it does

이 스크립트는 아래 작업을 자동으로 수행합니다.

- git clone
- custom `.gitignore` file copy
- Python virtual environment creation
- pip upgrade
- `requirements.txt` install
- django-extensions install
- JupyterLab install
- ipykernel install and Jupyter kernel registration

## Folder Structure

```text
scripts/
├─ setup_assignment.ps1
├─ setup_assignment.sh
└─ django_gitignore_template.txt
```

## How to use

### 1. 프로젝트 구조 준비

예시:

```text
django-assignment/
├─ scripts/
│  ├─ setup_assignment.ps1
│  └─ django_gitignore_template.txt
├─ assignment1/
├─ assignment2/
└─ ...
```

- 과제 폴더로 이동
```shell
cd C:\Users\SSAFY\Desktop\yujeong\django_assignment\assignment4
```

- 스크립트 실행

**shell**
```shell
..\scripts\setup_assignment.ps1 -RepoUrl "https://github.com/your-repo/example.git"
```
**bash**
```bash
source ..\scripts\setup_assignment.sh -RepoUrl "https://github.com/your-repo/example.git"
```

- 가상환경 활성화

**shell**
```shell
\venv\Scripts\activate
```
**bash**
```bash
source \venv\Scripts\activate
```

- 작업 시작
```text
가상환경이 활성화되면 Django 과제를 이어서 진행하면 됩니다.
```

## ORM 사용하기
1. JupyterLab실행
```shell
python manage.py shell_plus --lab
```

2. 노트북 첫 셀에 아래 공통 설정을 입력합니다.
```python
import os
import django

# # 프로젝트명 인식 못할 경우 추가
# import sys
# PROJECT_ROOT = r"작업경로"

# os.chdir(PROJECT_ROOT)
# sys.path.insert(0, PROJECT_ROOT)

# manage.py에 적힌 DJANGO_SETTINGS_MODULE 값을 그대로 사용
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project_name.settings")
os.environ["DJANGO_ALLOW_ASYNC_UNSAFE"] = "true"
django.setup()
```

3. ORM 사용
```python
from app_name.models import ModelName
ModelName.objects.all()
```


## Notes
- Windows PowerShell 기준으로 작성되었습니다.
- requirements.txt가 있는 경우 자동으로 설치합니다.
- .gitignore는 템플릿 파일 내용으로 생성됩니다.
- JupyterLab이 필요 없다면 스크립트에서 해당 부분을 제거해서 사용할 수 있습니다.
- `django-extensions`가 자동으로 설치됩니다.
- `shell_plus`를 사용하려면 각 Django 프로젝트의 `settings.py`의 `INSTALLED_APPS`에 `'django_extensions'`를 추가해야 합니다.

## Customize
ignore 목록을 수정하고 싶다면 아래 파일을 수정하면 됩니다.
```text
scripts/django_gitignore_template.txt
```