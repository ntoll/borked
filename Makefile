SHELL := /bin/bash

all:
	@echo "There's no default Makefile target right now. Try:"
	@echo ""
	@echo "make serve - serve the project at: http://0.0.0.0:8000/"
	@echo "make test - while serving the app, run the test suite in browser."

clean:
	rm -rf .pytest_cache
	rm -rf pyodide
	find . \( -name '*.bz2' -o -name dropin.cache \) -delete
	find . | grep -E "(__pycache__)" | xargs rm -rf


setup: clean
	wget https://github.com/pyodide/pyodide/releases/download/0.22.1/pyodide-0.22.1.tar.bz2
	tar xjf pyodide-0.22.1.tar.bz2

serve:
	python -m http.server

test:
	pytest --run-in-pyodide . --rt chrome

