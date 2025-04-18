@echo off & chcp 65001 >nul

set PLUGIN_PATH=protoc-gen-gdscript.exe
set PROTO_ROOT=proto
set OUTPUT_DIR=output

:: 目录预检
if not exist "%PROTO_ROOT%" ( mkdir "%PROTO_ROOT%" )
if not exist "%OUTPUT_DIR%" ( mkdir "%OUTPUT_DIR%" )

:: 分文件处理
for %%f in ("%PROTO_ROOT%\*.proto") do (
    echo Processing %%f
    protoc --plugin=protoc-gen-gdscript="%PLUGIN_PATH%" ^
           --gdscript_out="%OUTPUT_DIR%" ^
           --proto_path="%PROTO_ROOT%" ^
           "%%f"
)

echo 生成完成于 %OUTPUT_DIR%
pause
