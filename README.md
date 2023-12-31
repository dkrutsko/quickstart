# QuickStart
This playbook installs and configures most of the software I use on my machines. Some things are slightly difficult to automate, so I still have a few manual installation steps, but they're all documented here.

## MacOS
* Install macOS, set up a primary user account, and log in with your Apple ID

* Allow third-party kernel extensions to be installed
	* Shut down then press and hold the power button to enter recovery mode
	* Go to `Options` -> `[User Account]` -> `Utilities` -> `Startup Security Utility`
	* Select `Macintosh HD` -> `Security Policy`
	* Check `Reduced Security` and `Allow user management of kernel extensions`
	* Restart your computer and log in

* Update the system
```bash
sudo softwareupdate -ia
```

* Install command line tools
```bash
xcode-select --install
```

* Enable remote login
	* Go to `System Settings` > `General` > `Sharing`
	* Turn on `Remote Login` and click the `(i)`
	* Turn on `Allow full disk access for remote users`
	* Click `Done` and close the system settings

* Install SSH key
```bash
mkdir -p "$HOME/.ssh"; grep -qsF " dave" "$HOME/.ssh/authorized_keys" || curl -sS "https://github.com/dkrutsko.keys" | head -n 1 | sed "s/$/ dave\n/" >> "$HOME/.ssh/authorized_keys"
```

---

* From this point, switch to computer running Ansible

* Test the connection to your Mac
	* Update the `./inventory` file to point to Mac
	```
	[mac_ip] ansible_user=[mac_user]
	```
	* Run the ping command to test the connectivity
	```bash
	ansible -m ping "[host]" --user "[mac_username]" --private-key "[ssh_key_file]"
	```

* Install required Ansible roles
```bash
ansible-galaxy install -r "./requirements.yml"
```

* Run desired Ansible playbook
```bash
ansible-playbook "./playbooks/[playbook].yml" -K --user "[mac_username]" --private-key "[ssh_key_file]"
```
