# MacOS
* Install MacOS, set up a primary user account, and log in with an Apple ID

* Allow third-party kernel extensions to be installed
	* Shut down then press and hold the power button to enter recovery mode
	* Go to `Options` -> [User Account] -> Utilities -> Startup Security Utility
	* Select Macintosh HD -> Security Policy
	* Check `Reduced Security` and `Allow user management of kernel extensions`
	* Restart the computer and log in

* Update the system
`sudo softwareupdate -ia`

* Install command line tools
`xcode-select --install`

* Enable remote login
	* Go to `System Settings` > General > Sharing
	* Turn on `Remote Login` and click the `(i)`
	* Turn on `Allow full disk access for remote users`
	* Click done and close the system settings

* Install SSH key
`mkdir -p "$HOME/.ssh"; grep -qsF " dave" "$HOME/.ssh/authorized_keys" || curl -sS "https://github.com/dkrutsko.keys" | head -n 1 | sed "s/$/ dave\n/" >> "$HOME/.ssh/authorized_keys"`

---

* From this point, switch to computer running Ansible

* Test the connection to the Mac
	* Update the `./inventory` file to point to Mac
	`[mac_ip] ansible_user=[mac_user]`
	* Run the ping command to test the connectivity
	`ansible -m ping "[host]" --user "[mac_username]" --private-key "[ssh_key_file]"`

* Install required Ansible roles
`ansible-galaxy install -r "./requirements.yml"`

* Run desired Ansible playbook
`ansible-playbook "./playbooks/[playbook].yml" -K --user "[mac_username]" --private-key "[ssh_key_file]"
