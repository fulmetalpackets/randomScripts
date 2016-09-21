 Get-Process | %{$id = $_.id; ..\vmmap.exe -p $id "$id.csv"; Start-Sleep 1;Select-String "Execute" "$id.csv"}
