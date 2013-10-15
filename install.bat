@echo off

setlocal

if exist install.bat goto ok
echo install.bat must be run from its folder
goto end

:ok

set OLDGOPATH=%GOPATH%
set GOPATH=%GOPATH%;%~dp0

if not exist log mkdir log

go get -u github.com/go-sql-driver/mysql
go get -u github.com/gorilla/mux
go get -u github.com/gorilla/securecookie
go get -u github.com/astaxie/beego/cache

gofmt -w src

:: -tags "debug" 表示测试
go install -tags "debug" gocollipa

set GOPATH=%OLDGOPATH%

:end
echo finished