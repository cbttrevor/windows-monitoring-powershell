# Find the event logs available on the system (classic)
Get-EventLog -List

# Find event logs on the system (new)
# Doesn't explicitly require Administrator, but some logs do
Get-WinEvent -ListLog *

# Let's try writing a new log entry with Write-EventLog 
Write-EventLog -LogName CBTNuggets -Source PowerShell -EntryType Information -EventId 1001 -Message 'Hello world'

# Let's create a new event log (requires Administrator)
New-EventLog -Source CBTNuggets -LogName CBTNuggets

# Let's try that again
Write-EventLog -LogName CBTNuggets -Source CBTNuggets -EntryType Information -EventId 1001 -Message 'Hello world'

# Now let's find the log and retrieve it
Get-WinEvent -ListLog CBT* | fl *
Get-WinEvent -LogName CBTNuggets

# Clean up the event log when we're done
Remove-EventLog -LogName CBTNuggets