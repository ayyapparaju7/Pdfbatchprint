$inputFolder = "C:\Sysadmin\Assest\Print\Input" # CHANGE THIS
$printedFolder = "C:\Sysadmin\Assest\Print\Printed" # CHANGE THIS
$logFile = "C:\Sysadmin\Assest\Print\print_log.txt" # CHANGE THIS
$printerName = "RICOH M 2701 DDST"   # CHANGE THIS
$delaySeconds  = 10                    # Delay between files (you can change)

$acrobat = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

function Log($msg){
    $time = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Add-Content $logFile "$time  $msg"
}

# Ensure folders
New-Item -ItemType Directory -Force -Path $printedFolder | Out-Null
New-Item -ItemType Directory -Force -Path (Split-Path $logFile) | Out-Null

Clear-Host
Write-Host ""
Write-Host "========================================="
Write-Host "        BULK PRINT MANAGER STARTED       "
Write-Host "========================================="
Write-Host ""

Log "===== BULK PRINT STARTED ====="

$files = Get-ChildItem $inputFolder -Filter *.pdf | Sort-Object Name
$total = $files.Count
$index = 0

foreach($file in $files){

    $index++
    $percent = [int](($index / $total) * 100)

    # PROGRESS BAR (tqdm style)
    Write-Progress -Activity "Printing PDFs..." `
        -Status "File $index of $total : $($file.Name)" `
        -PercentComplete $percent

    Write-Host ""
    Write-Host "Printing ($index/$total): $($file.Name)" -ForegroundColor Cyan

    Log "Sending to printer: $($file.Name)"

    # Send to printer
    Start-Process -FilePath $acrobat `
        -ArgumentList "/t `"$($file.FullName)`" `"$printerName`"" `
        -WindowStyle Hidden

    # wait for job to appear
    Start-Sleep -Seconds 12

    # Wait until printer finishes
    do{
        $jobs = Get-PrintJob -PrinterName $printerName -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 4
    } while($jobs)

    # Close Acrobat background
    Get-Process AcroRd32 -ErrorAction SilentlyContinue | Stop-Process -Force

    # Move to printed
    Move-Item $file.FullName $printedFolder -Force

    Log "Printed OK: $($file.Name)"

    # DELAY BETWEEN FILES
    for($i=$delaySeconds; $i -ge 1; $i--){
        Write-Host -NoNewline "`rNext file in $i seconds... "
        Start-Sleep -Seconds 1
    }

    Write-Host "`rStarting next file...            "
}

# Finish progress
Write-Progress -Activity "Printing PDFs..." -Completed

Write-Host ""
Write-Host "========================================="
Write-Host "      ALL FILES PRINTED SUCCESSFULLY     "
Write-Host "=========================================" -ForegroundColor Green

Log "===== ALL FILES COMPLETED ====="

[console]::beep(800,800)
[console]::beep(1000,800)
