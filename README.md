# hp-tech-challenge

## Manage ssh access across machines for set of developers

Prerequisites: vagrant 1.8.6 or higher with virtualbox

*Note*: Tested on ubuntu, expect this to work elsewhere, as its vagrant. The boxes are 32bit

### Start up vagrant environment
* clone this repo
* vagrant up


### Add a user
* vagrant ssh jump01
* ssh_user_mgt add <username>

When a user is created the keys are generated and stored at jump01:/home/vagrant/keys/<username>

### Remove a user
* vagrant ssh jump01
* ssh_user_mgt rm <username>
