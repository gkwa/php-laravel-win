# usage: make PROJECT=test

RM=rm -f

PROJECT=your-project-name

PRINT_DIR =
ifneq ($(findstring $(MAKEFLAGS),w),w)
	PRINT_DIR = --no-print-directory
endif


sqlite: $(PROJECT)
	sed -i.bak -e 's,;extension=php_pdo_sqlite.dll,extension=php_pdo_sqlite.dll,' phpwin/php/php.ini


$(PROJECT): | phpwin/composer
	sed -i.bak -e 's,;extension=php_mbstring.dll,extension=php_mbstring.dll,' phpwin/php/php.ini
	sed -i.bak -e 's/^; extension_dir = "ext"/extension_dir = ext/' phpwin/php/php.ini
	phpwin/composer create-project laravel/laravel $@ --prefer-dist

phpwin/composer:
	$(MAKE) $(PRINT_DIR) -C phpwin composer

inidiff:
	diff -uw phpwin/php/php.ini-development phpwin/php/php.ini

phpwin/php:
	$(MAKE) $(PRINT_DIR) -C phpwin php

clean:
	$(MAKE) -C phpwin clean

veryclean:
	$(MAKE) -C phpwin veryclean
	$(RM) -r $(PROJECT)
