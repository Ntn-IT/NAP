
# Pousse les dernière modiifcation sur git avec un message
# Ex: make commit msg a définir
commit:
	git add .
	git commit -m "$(filter-out $@,$(MAKECMDGOALS))"
	git push

# Récupère le code depuis le repository
pull:
	git pull