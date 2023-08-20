echo running pico-setup
git clone https://github.com/agmui/sample_rm_pico_app.git
cd sample_rm_pico_app
git submodule update --init --recommend-shallow 
cd rm_pico_dev
git submodule update --init --recommend-shallow 
cd lib/pico-sdk/
@REM set current dir to path
set PATH=%PICO_SDK_PATH%;%CD% 
git submodule update --init --recommend-shallow 

cd ../../../
start "" cmd /b /c code "./" && exit 0

@REM @if not defined _echo echo off

@REM set interactive=%~2

@REM mkdir "%~1"
@REM echo Copying pico-examples...
@REM powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive """%~dp0pico-examples.zip""" -DestinationPath """%~1""" -Force" || exit /b 1

@REM call "%~dp0pico-env.cmd" "%~1" || exit /b 1
@REM setlocal enabledelayedexpansion

@REM rem This is mostly a port of pico-setup
@REM rem https://github.com/raspberrypi/pico-setup/blob/master/pico_setup.sh

@REM set "GITHUB_PREFIX=https://github.com/raspberrypi/"
@REM set "GITHUB_SUFFIX=.git"
@REM set "SDK_BRANCH=master"

@REM pushd "%PICO_REPOS_PATH%"

@REM for %%i in (examples extras playground) do (
@REM   set "DEST=%PICO_REPOS_PATH%\pico-%%i"

@REM   if exist "!DEST!\.git" (
@REM     echo !DEST! exists, skipping clone
@REM   ) else (
@REM     set "REPO_URL=%GITHUB_PREFIX%pico-%%i%GITHUB_SUFFIX%"
@REM     echo Cloning !REPO_URL!
@REM     git clone -b %SDK_BRANCH% !REPO_URL! || exit /b 1

@REM     rem Any submodules
@REM     pushd "!DEST!"
@REM     git submodule update --init || exit /b 1
@REM     popd

@REM     set "PICO_%%i_PATH=!DEST!"
@REM   )
@REM )

@REM rem Build a couple of examples
@REM mkdir "%PICO_REPOS_PATH%\pico-examples\build"
@REM pushd "%PICO_REPOS_PATH%\pico-examples\build"
@REM cmake -G Ninja .. -DCMAKE_BUILD_TYPE=Debug --fresh || exit /b 1

@REM for %%i in (blink "hello_world/all") do (
@REM   echo Building %%i
@REM   ninja "%%i" || exit /b 1
@REM )

@REM popd

@REM if "%interactive%" equ "1" (
@REM   rem Open repo folder in Explorer
@REM   start .

@REM   rem Keep the terminal window open
@REM   pause
@REM )

@REM popd
