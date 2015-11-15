# Watchdog Timer

## About:

Detects status of given process. It it is not running then given start program is executed.

## Usage:

```
watchdog.bat {process-name} {start-program}

```
where:
* {process-name} - Name of running process in Windows (e.g. in Task Manager)
* {start-program} - Program used to start required process

## Examples:

Process name and start program are the same
```
watchdog.bat taskmgr.exe taskmgr.exe
```

Process name and start program are different
```
watchdog.bat myProcess.exe myStartProgram.exe
```

## Hint:

Edit timeouts (in seconds) used to wait for next check directly in batch script.
