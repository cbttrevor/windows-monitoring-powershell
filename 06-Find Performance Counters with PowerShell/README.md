## Learning Objectives

1. Use the Windows Performance Monitor to find relevant metrics
1. Use the `Get-Counter` command to search for relevant metrics

Both the Windows Performance Counter and PowerShell are complementary tools to each other.

You can use the following command to list out all the supported counter sets on the local system.

```powershell
Get-Counter -ListSet *
```

To make searching and filtering this data easier, I recommend piping the output into the `Out-GridView` command.
We'll set the `-OutputMode` parameter so that we can select a few counters and emit them back into the terminal session.

```
Get-Counter -ListSet * | Out-GriView -OutputMode Multiple
```



### Relevant Links

* [Get-Counter Documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.diagnostics/get-counter?view=powershell-7.1)
* 