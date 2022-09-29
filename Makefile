.PHONY: lint

lint:
	black --check --include '(\.envd|\.py|\.ipynb)$$' .

format:
	black --include '(\.envd|\.py|\.ipynb)$$' .
