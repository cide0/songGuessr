CLI = docker-compose -f docker/compose/docker-compose-cli.yml
PHPUNIT = /var/www/html/vendor/bin/phpunit

.PHONY: list
list:
	@echo
	@cat Makefile | grep '^[a-z0-9_-]\+:' | sed 's/:.*//' | sed 's/^/  make /' | sort
	@echo

.PHONY: build-dev
build-dev:
	docker build -f docker/php/Dockerfile . \
	-t songguessr/php:dev
	docker build -f docker/nginx/Dockerfile . \
	-t songguessr/nginx:dev
	docker build -f docker/php_cli/Dockerfile . \
	-t songguessr/php_cli:dev
	docker build -f docker/mysql/Dockerfile . \
    -t songguessr/mysql:dev

.PHONY: up
up:
	docker-compose -f docker/compose/docker-compose-dev.yml up -d
	docker ps

.PHONY: down
down:
	docker-compose -f docker/compose/docker-compose-dev.yml down
	docker ps

.PHONY: install
install: build-dev
	$(CLI) run --rm --no-deps php_cli php -d memory_limit=-1 /usr/local/bin/composer install

.PHONY: update
update:
	$(CLI) run --rm --no-deps php_cli php -d memory_limit=-1 /usr/local/bin/composer update

.PHONY: composer-dump
composer-dump:
	$(CLI) run --rm --no-deps php_cli php -d memory_limit=-1 /usr/local/bin/composer dump-autoload

.PHONY: cleanup
cleanup:
	docker system prune -a -f --volumes

.PHONY: backup
backup:
	docker exec songguessr_mysql /usr/bin/mysqldump -u root --password=admin songguessr > "./docker/mysql/backups/`date +%Y-%m-%d`.sql"

.PHONY: import-db-backup
import-db-backup:
	docker cp "./docker/mysql/backups/$(FILENAME)" songguessr_mysql:backup.sql && \
	docker exec songguessr_mysql bash -c "mysql -uroot -padmin songguessr < backup.sql"

.PHONY: reset-test-db
reset-test-db:
	docker cp "./docker/mysql/backups/$(FILENAME)" songguessr_mysql:backup.sql && \
	docker exec songguessr_mysql bash -c "mysql -uroot -padmin songguessr_testing < backup.sql"

.PHONY: unit-test
unit-test:
	$(CLI) run php_cli php -dxdebug.coverage_enable=1 -dxdebug.mode=coverage $(PHPUNIT) \
                           --coverage-html tests/reports/html \
                           --coverage-clover tests/reports/coverage/phpunit.coverage.xml \
                           --configuration tests/phpunit.xml \
                             tests/unit
	sed -i "s|/var/www/html|$$(pwd)/code|g" code/tests/reports/coverage/phpunit.coverage.xml
	git update-index --assume-unchanged code/tests/reports/coverage/phpunit.coverage.xml