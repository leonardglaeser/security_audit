strComputer = "."
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colGroupChangeMonitor = objWMIService.ExecNotificationQuery("SELECT * FROM __InstanceOperationEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_GroupUser'")
Do While true
 Set objLatestGroupChange = colGroupChangeMonitor.NextEvent
 Dim strEventtype 
 strEventtype = objLatestGroupChange.Path_.Class
 Set gc = objLatestGroupChange.TargetInstance
 Wscript.Echo gc.GroupComponent & gc.PartComponent & strEventtype, Now
Loop