# Text file containing users
$filePath = "C:\path\to\DeleteUserList.txt"

# Validate if file exists
if (Test-Path $filePath) {
    # Read content of the file
    $userNames = Get-Content $filePath

    # Loop through each user in the file
    foreach ($userName in $userNames) {
        # Validate if user exists
        if (Get-ADUser -Filter {SamAccountName -eq $userName}) {
            # Delete the user
            Remove-ADUser -Identity $userName -Confirm:$false
            Write-Host "User '$userName' deleted successfully."
        } else {
            Write-Host "User '$userName' not found."
        }
    }
} else {
    Write-Host "File not found at $filePath."
}
