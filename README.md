```
ssh-keygen -t ed25519 -C "daisuke@Ubuntu"
cat ~/.ssh/id_ed25519.pub
```

Then, open https://github.com/settings/keys and add the key there.

```
mkdir -p work/projects
cd work/projects
sudo apt install ansible
```

Do a git clone, enter the directory, and
```
ansible-playbook ansible.yml --ask-become-pass
```
