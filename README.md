# win_penetration

powered by [nishang](https://github.com/samratashok/nishang), [PowerSploit](https://github.com/mattifestation/PowerSploit)

### main behaviour
- bypass UAC and extract payload to tmp directory
- run the payload script
    - add powershell root path to env path
	- copy self to temp path and powershell root path
    - turn of the LUA and firewall
	- add persistence
	- register self to auto-run
	- dump login user password
	- fetch info from remote server
	- download and excute exe
	- run PowerShellTcp listenning on 192.168.10.99:8099
	

### todo
- [x] download and excute exe
- [x] fetch attacker's ip&port on remote server
- [ ] rewrite build script by using python lang
- [ ] rookit (Invoke-ReflectivePEInjection)
- [x] auto-run with high authority