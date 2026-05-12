#!/usr/bin/env bash

# This script must be run with source so that cd affects the current Git Bash session.
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  echo "This script must be run with source."
  echo "Example:"
  echo "source ../scripts/setup_assignment.sh -RepoUrl https://lab.ssafy.com/jjungyu1282/django_hw_10_2"
  exit 1
fi

repo_url=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    -RepoUrl)
      repo_url="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      return 1
      ;;
  esac
done

if [[ -z "$repo_url" ]]; then
  echo "RepoUrl is required."
  echo "Example:"
  echo "source ../scripts/setup_assignment.sh -RepoUrl https://github.com/your-repo/example.git"
  return 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
gitignore_template="$script_dir/django_gitignore_template.txt"

repo_name="$(basename "$repo_url")"
repo_name="${repo_name%.git}"

git clone "$repo_url" || return 1
cd "$repo_name" || return 1

if [[ -f "$gitignore_template" ]]; then
  cp "$gitignore_template" ".gitignore"
fi

python -m venv venv

./venv/Scripts/python.exe -m pip install --upgrade pip

if [[ -f "requirements.txt" ]]; then
  ./venv/Scripts/python.exe -m pip install -r requirements.txt
fi

# Install useful development tools
# - django-extensions: provides convenient Django commands such as shell_plus
# - jupyterlab: provides a browser-based notebook environment
# - ipykernel: registers the current virtual environment as a Jupyter kernel
./venv/Scripts/python.exe -m pip install django-extensions djangorestframework jupyterlab ipykernel
./venv/Scripts/python.exe -m ipykernel install --user --name "$repo_name" --display-name "Python ($repo_name)"

echo ""
echo "Setup complete"
echo "Current location:"
pwd
echo ""
echo "To activate the virtual environment, run:"
echo "source venv/Scripts/activate"