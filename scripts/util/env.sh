function lc(){
  echo $1 | awk '{print tolower($0)}'
}

DB_PORT=5433
PROJECT_NAME=titanic
PROJECT_NAME_LOWERCASE=$(lc $PROJECT_NAME)
FRONTEND_NAME=titanic-frontend
GIT_URL=git@github.com:zixdev/titanic.git
