## Learning Objectives

PowerShell has excellent support for asynchronous event registration.
You can write a PowerShell script that listens for specific events in the Windows Event Log.

First, you need to get a reference to the specific event log that you want to monitor.
You can list out event logs using the `Get-WinEvent` command.

```powershell
Get-WinEvent -ListLog * -ErrorAction Ignore | Select-Object -First 10 | Format-Table -AutoSize
```

Partial output from the above command.

```
LogMode  MaximumSizeInBytes RecordCount LogName
-------  ------------------ ----------- -------
Circular           15728640        7775 Windows PowerShell
Circular           20971520       38649 System
Circular            1052672           4 OAlerts
Circular           20971520           0 Key Management Service
Circular            1052672           0 Internet Explorer
Circular           20971520           0 HardwareEvents
Circular            4000000        5882 Cisco AnyConnect Secure Mobility Client
Circular           20971520       34249 Application
Circular            1052672             Windows Networking Vpn Plugin Platform/OperationalVerbose
Circular            1052672             Windows Networking Vpn Plugin Platform/Operational
```

Next, you'll need to create an instance of the event log that you want to monitor.
The System.Diagnostics .NET namespace contains a class named `EventLog` that you can use to accomplish this.

```powershell
$SystemLog = [System.Diagnostics.EventLog]::new('CBTNuggets')
```

Now we need to figure out which events are supported on this `EventLog` object.
We can use PowerShell's handy `Get-Member` command to accomplish this.

```powershell

```