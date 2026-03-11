\# ms-gamingoverlay Fix



A simple Windows fix for the following popup after removing Xbox Game Bar:



> Get an app to open this 'ms-gamingoverlay' link



\## Problem

Some games, shortcuts, or Windows components still try to open the `ms-gamingoverlay` protocol even after Xbox Game Bar has been removed.



Because the app is no longer installed, Windows shows a popup asking you to choose an app from Microsoft Store.



\## Solution

This project registers a silent local handler for `ms-gamingoverlay` so the popup does not appear anymore.



It also disables Game DVR related settings and restarts Windows Explorer so the change takes effect immediately.



\## Files

\- `fix-ms-gamingoverlay.bat`  

&nbsp; Installs the fix, creates the helper VBS file, updates the registry, and restarts Explorer.



\- `revert-ms-gamingoverlay.bat`  

&nbsp; Removes the fix and deletes the helper file.



\## Helper file path

The fix creates this file:



```text

C:\\Users\\Public\\ignore-gamingoverlay.vbs

````



This path is used because it is stable and does not depend on a specific username.



\## How to use



1\. Right click `fix-ms-gamingoverlay.bat`

2\. Choose \*\*Run as administrator\*\*

3\. Wait for completion



\## Revert



1\. Right click `revert-ms-gamingoverlay.bat`

2\. Choose \*\*Run as administrator\*\*



\## Notes



This does \*\*not\*\* reinstall Xbox Game Bar.

It only suppresses the popup by redirecting the protocol to a harmless local script.



\## Screenshot



!\[ms-gamingoverlay error](images/ms-gamingoverlay-error.png)



This is the popup shown by Windows after Xbox Game Bar is removed while the `ms-gamingoverlay` protocol is still being called by the system or a game.



