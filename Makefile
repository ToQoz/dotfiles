installer: ./installer/*.go
	go build -o ./installer/installer ./installer
install: installer
	./installer/installer
