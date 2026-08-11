# Alvos do projeto.
#
# O make executa cada receita via /bin/sh, que não carrega aliases do shell
# interativo. Por isso `poetry` aqui resolve sempre para o binário no PATH,
# independente de aliases (como `poetry` -> `safety poetry`) definidos no fish.

POETRY ?= poetry
BIN    := .venv/bin

# Força o venv em .venv/ dentro do projeto. Sem isso o Poetry usa o cache
# global (~/.cache/pypoetry/virtualenvs) por padrão e o $(BIN) não existiria
# em máquinas novas nem no CI. A variável de ambiente tem precedência sobre
# qualquer config local ou global do Poetry.
export POETRY_VIRTUALENVS_IN_PROJECT := true

.DEFAULT_GOAL := help
.PHONY: help install serve build clean

help: ## Mostra esta ajuda
	@grep -hE '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) \
		| awk -F':.*?## ' '{printf "  \033[36m%-8s\033[0m %s\n", $$1, $$2}'

install: ## Instala as dependências no .venv
	$(POETRY) install --no-root

serve: | $(BIN)/zensical ## Sobe o preview em http://localhost:8000
	$(BIN)/zensical serve

build: | $(BIN)/zensical ## Gera o site estático em site/
	$(BIN)/zensical build --strict --clean

clean: ## Remove o site gerado
	rm -rf site

# Instala sozinho se o .venv ainda não existir.
$(BIN)/zensical:
	$(POETRY) install --no-root
