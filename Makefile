commit:
	git add .
	git commit -m "$(filter-out $@,$(MAKECMDGOALS))"
	git push