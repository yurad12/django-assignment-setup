# Django Assignment Setup Script

SSAFY Django 과제를 시작할 때 반복적으로 하게 되는 초기 세팅 작업을 자동화하기 위한 PowerShell 스크립트입니다.

## What it does

이 스크립트는 아래 작업을 자동으로 수행합니다.

- git clone
- custom `.gitignore` file copy
- Python virtual environment creation
- pip upgrade
- `requirements.txt` install
- Jupyter Notebook install (optional)

## Folder Structure

```text
scripts/
├─ setup_assignment.ps1
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
```shell
..\scripts\setup_assignment.ps1 -RepoUrl "https://github.com/your-repo/example.git"
```

- 가상환경 활성화
```shell
"\venv\Scripts\activate"
```

- 작업 시작
```text
가상환경이 활성화되면 Django 과제를 이어서 진행하면 됩니다.
```

## Notes
- Windows PowerShell 기준으로 작성되었습니다.
- requirements.txt가 있는 경우 자동으로 설치합니다.
- .gitignore는 템플릿 파일 내용으로 생성됩니다.
- Jupyter Notebook 설치가 필요 없다면 스크립트에서 해당 부분을 제거해서 사용할 수 있습니다.

## Customize
ignore 목록을 수정하고 싶다면 아래 파일을 수정하면 됩니다.