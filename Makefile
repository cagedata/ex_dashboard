-include .env

IMAGE := davejlong/ex_dashboard

setup:
	@mix deps.get
	@npm install

server:
	@mix kitto.server

console:
	@iex -S mix compile

image:
	docker build -t ${IMAGE} .
