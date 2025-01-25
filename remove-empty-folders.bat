@echo off
chcp 65001
setlocal enabledelayedexpansion
set absPath=%1
if NOT "!absPath!"=="--force" (
    if "!absPath!"=="" (
        echo "ЭЙ ДОЛБАЕБ УКАЖИ ПАРАМЕТР| ВОЗМОЖНО, ЧТО ТЫ ЧУТЬ СИСТЕМУ НЕ РУХНУЛ!"
        echo "РАЗ ТЕБЕ ТАК СЛОЖНО ЧИТАТЬ ДОКУМЕНТАЦИЮ, Я СДЕЛАЮ ЗА ТЕБЯ И ПОКАЖУ КАК ЮЗАТЬ"
        echo "ПРИМЕР: remove-empty-folders.bat [абсолютный-путь-до-папки]"
        echo "ЕСЛИ ТЫ НЕ БОИШЬСЯ МЕНЯ, ДОВЕРЯЕШЬСЯ РЕПЕ С ГИТХАБА И ХОЧЕШЬ ЧИСТИТЬ ДИРЕКТОРИИ С КОРНЯ, ТО ИСПОЛЬЗУЙ ПАРАМЕТР --force"
        echo "ПРИМЕР: remove-empty-folders.bat --force"
        exit
    )
)
for /d %%d in (%absPath%\*) do (
    set count=0
    for %%F in (%%d\*) do (
        set /a count+=1
    )

    for /d %%a in (%%d\*) do (
        set /a count+=1
    )

    if "!count!"=="0" (
        echo removed folder: %%d\* !count!
        rem rmdir %cd%\%%d\
    )
)
endlocal
