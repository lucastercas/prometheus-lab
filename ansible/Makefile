.PHONY: install-requirements install-role run-monitoring run-monitored

run-monitoring:
	@docker run --rm -ti \
		-w /opt/app \
		-v $(CURDIR):/opt/app \
		-v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		-v ~/.ssh/id_rsa.pub:/root/ssh/id_rsa.pub \
		lucastercas/ansible \
			ansible-playbook -i inventories/all.yml monitoring.yml

run-monitored:
	@docker run --rm -ti \
		-w /opt/app \
		-v $(CURDIR):/opt/app \
		-v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		-v ~/.ssh/id_rsa.pub:/root/ssh/id_rsa.pub \
		lucastercas/ansible \
			ansible-playbook -i inventories/all.yml monitored.yml

install-requirements:
	@docker run --rm -it \
		-w /opt/app \
		-v $(CURDIR):/opt/app \
		lucastercas/ansible \
			ansible-galaxy install -r requirements.yml

install-role:
	@docker run --rm -it \
		-w /opt/app
		-v $(CURDIR):/opt/app \
		lucastercas/ansible \
			ansible-galaxy install role $(role)

clean:
	@echo "Cleaning..."
	rm -rf roles/*
	rm ./*.retry