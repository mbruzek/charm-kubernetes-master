
build: virtualenv lint test

virtualenv:
	virtualenv .venv
	.venv/bin/pip install -q -r requirements.txt

lint: virtualenv
	@.venv/bin/flake8 hooks unit_tests --exclude=charmhelpers
	@.venv/bin/charm proof

test: virtualenv 
	@CHARM_DIR=. PYTHONPATH=./hooks .venv/bin/py.test unit_tests/*

functional-test:
	@bundletester

clean:
	rm -rf .venv
	find -name *.pyc -delete
