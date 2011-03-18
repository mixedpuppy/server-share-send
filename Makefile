APPNAME = server-shared-send
DEPS = server-core
VIRTUALENV = virtualenv
NOSE = bin/nosetests -s --with-xunit
TESTS = linkdrop/tests
PYTHON = bin/python
EZ = bin/easy_install
COVEROPTS = --cover-html --cover-html-dir=html --with-coverage --cover-package=linkdrop
COVERAGE = bin/coverage
PYLINT = bin/pylint
PKGS = linkdrop
BENCH = bin/fl-run-bench
REPORT = bin/fl-build-report

.PHONY: all build test

all:	build

build:
	$(VIRTUALENV) --no-site-packages --distribute .
	$(PYTHON) build.py $(APPNAME) $(DEPS)
	$(EZ) nose
	$(EZ) WebTest
	$(EZ) Funkload
	$(EZ) pylint
	$(EZ) coverage

test:
	$(NOSE) $(TESTS)
