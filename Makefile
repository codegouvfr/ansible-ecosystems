ANSIBLE_PLAYBOOK=ansible-playbook --inventory hosts.yml

site:
	$(ANSIBLE_PLAYBOOK) site.yml
common:
	$(ANSIBLE_PLAYBOOK) common.yml
dokku: check_master_key
	$(ANSIBLE_PLAYBOOK) dokkuservers.yml
deps:
	ansible-galaxy role install dokku_bot.ansible_dokku

check_master_key:
ifndef RAILS_MASTER_KEY
	@echo "ERROR: RAILS_MASTER_KEY is not set. Please set the RAILS_MASTER_KEY environment variable."
	@exit 1
endif
