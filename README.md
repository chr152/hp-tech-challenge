# hp-tech-challenge

## Manage ssh access across machines for set of developers

Prerequisits: vagrant 1.8.6 or higher
*Note*: Tested on ubuntu, expect this to work elsewhere, as its vagrant
      : The boxes are 32bit

### Start up vagrant environment
* clone this repo
* vagrant up


### Add a user
* vagrant ssh jump01
* ssh_add_user <username>


### Remove a user
* vagrant ssh jump01
* ssh_rm_user <username>
