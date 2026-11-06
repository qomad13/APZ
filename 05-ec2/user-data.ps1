<# 
================================================================================
APZ Lab 5 - EC2 Windows user-data script
Runs automatically when the Windows EC2 instance launches (EC2 Launch Config /
User data). Creates the individual task document with the student's name and group.
================================================================================
#>

$studentName = "Ледачков Ілля Сергійович"
$studentGroup = "121-23-1"
$university = "Національний технічний університет «Дніпровська політехніка»"
$city = "Дніпро"
$date = Get-Date -Format "dd.MM.yyyy"

$docPath = "$env:USERPROFILE\Desktop\Студентський_документ_АПЗ.txt"

$content = @"
Звіт про виконання індивідуального завдання
==========================================

Виконав: $studentName
Група: $studentGroup
Університет: $university
Місто: $city
Дата: $date
Дисципліна: АПЗ (Аналіз програмного забезпечення)

Сервіс: Amazon EC2 (Elastic Compute Cloud)
ОС: Microsoft Windows Server (Free Tier)
Спосіб підключення: RDP (mstsc) за публічною IPv4-адресою
Аутентифікація: ключова пара .pem, розшифрування пароля адміністратора

Цей документ створено автоматично скриптом user-data.ps1 під час запуску
віртуальної машини у хмарі AWS EC2.
"@

Set-Content -Path $docPath -Value $content -Encoding UTF8

Write-Host "Створено документ: $docPath"
