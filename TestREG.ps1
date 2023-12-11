#Registry Path 
$regPath = #<Registry Path>
#Registry Key 
$valueName = #<Registry Value Name>
#Registry Value 
$requiredValue = #<Required Value>

$regkeyexists = Test-Path -Path $regPath
if ($regkeyexists) {
   #Check if Registry Path exists
   $regentryexists = Get-ItemProperty -Path $regpath -Name Status -ErrorAction SilentlyContinue
   if ($regentryexists) {
   #If Registry Key exists, then get value
    $currentValue = Get-ItemProperty -Path $regpath | Select-Object -ExpandProperty $valueName -ErrorAction SilentlyContinue
    #Compare value with requied Value
    if ($currentValue -eq $requiredvalue) {
            Write-Host "Reg value exists and matching the required value."
        } else {
            Write-Host "Reg value exists, but does not match the required value."
            Write-Host "Current value: $currentValue"
            Write-Host "Required value: $requiredValue"
        }
    } 
    else {
        Write-Host "Registry value does not exist."
    }
} 
else {
    Write-Host "Registry key does not exist."
}