@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64

if not exist build mkdir build
pushd build

SET CompilerFlags=-GR- -EHsc -Od -WX -W4 -wd4201 -wd4100 -wd4189 -wd4505 -Zi /std:c++latest /nologo

SET LinkerFlags=-opt:ref SDL2.lib SDL2_ttf.lib opengl32.lib glu32.lib /LIBPATH:C:\SDL2-2.0.12\lib\x64 /LIBPATH:C:\SDL2_ttf-2.0.15\lib\x64  /SUBSYSTEM:CONSOLE

SET IncludeDirectories=/I "C:\SDL2-2.0.12\include" /I "C:\SDL2_ttf-2.0.15\include"

echo.
echo.

echo.
echo.
echo ========================== Building Win32 Executable ==========================
echo.

cl %CompilerFlags% %IncludeDirectories% ..\src\tetris.cpp /link %LinkerFlags%

echo ===============================================================================

popd
