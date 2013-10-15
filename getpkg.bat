@echo off

setlocal

if exist getpkg.bat goto ok
echo getpkg.bat must be run from its folder
goto end

:ok

set OLDGOPATH=%GOPATH%
if not exist ..\thirdparty mkdir ..\thirdparty
set GOPATH=%~dp0..\thirdparty

go get -u github.com/go-sql-driver/mysql
go get -u github.com/gorilla/mux
go get -u github.com/gorilla/securecookie
go get -u github.com/astaxie/beego/cache

:: hg clone https://code.google.com/p/go.net src/go.net
:: go install go.net/websocket 

set GOPATH=%OLDGOPATH%

:end
echo finished