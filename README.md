# win_penetration

powered by [nishang](https://github.com/samratashok/nishang), [PowerSploit](https://github.com/mattifestation/PowerSploit)

### usage  
- run **`pack.bat`**

### main behaviour
- bypass UAC and extract the payload to temp directory
- excute the payload script
    - add powershell root path to env path
	- copy self to temp directory and powershell root directory
    - turn off the LUA and firewall
	- add persistence
	- add self to windows autorun registry
	- dump user's login password
	- download and excute exe from remote server
	- excute PowerShellTcp for listenning remote control
	

### todo
- [x] python pack helper
- [ ] rookit (Invoke-ReflectivePEInjection)
- [x] auto-run with high authority
