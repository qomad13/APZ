<# 
================================================================================
APZ Lab 5 - create-student-doc.ps1
Run inside the Windows EC2 instance (via RDP) to create the individual task
document with the student's name and group.
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

Цей документ створено скриптом create-student-doc.ps1 після підключення до
ВМ у хмарі AWS EC2 через RDP.
"@

Set-Content -Path $docPath -Value $content -Encoding UTF8

Write-Host "Документ створено: $docPath"
