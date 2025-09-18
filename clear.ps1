Clear-Host
$ascii = @"
 /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\
( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )
 > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ < 
 /\_/\   ____        _        _____           _ _   _           /\_/\
( o.o ) |  _ \      | |      / ____|         (_) | | |         ( o.o )
 > ^ <  | |_) |_   _| |_ ___| (___  _ __ ___  _| |_| |__  ___   > ^ < 
 /\_/\  |  _ <| | | | __/ _ \\___ \| '_ ` _ \| | __| '_ \/ __|  /\_/\
( o.o ) | |_) | |_| | ||  __/____) | | | | | | | |_| | | \__ \ ( o.o )
 > ^ <  |____/ \__, |\__\___|_____/|_| |_| |_|_|\__|_| |_|___/  > ^ < 
 /\_/\          __/ |                                           /\_/\
( o.o )        |___/                                           ( o.o )
 > ^ <                                                          > ^ < 
 /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\
( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )
 > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ < 
"@

function Show-RainbowLogo {
    $colors = @('Red','Yellow','Green','Cyan','Blue','Magenta','White')
    for ($i = 0; $i -lt 15; $i++) {
        $color = $colors[$i % $colors.Count]
        Clear-Host
        Write-Host $ascii -ForegroundColor $color
        Start-Sleep -Milliseconds 200
    }
}

Show-RainbowLogo

# Restaurar utilidad: cerrar procesos del usuario excepto los excluidos
$excluded = @('svchost.exe', 'explorer.exe', 'cmd.exe', 'tasklist.exe', 'AnyDesk.exe')
$currentUser = "$env:USERDOMAIN\$env:USERNAME"
$processes = Get-Process | Where-Object {
    try {
        $_.StartInfo.UserName -eq $currentUser -or !$_.StartInfo.UserName
    } catch { $true } # Algunos procesos no exponen StartInfo.UserName
} | Where-Object {
    ($_.ProcessName + '.exe') -notin $excluded
}

foreach ($proc in $processes) {
    try {
        Write-Host ""
        Stop-Process -Id $proc.Id -Force
        Write-Host ""
    } catch {
        # Ignorar errores para procesos que no se pueden terminar
    }
}
Pause