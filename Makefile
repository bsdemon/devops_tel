# Define variables
SHELL := /bin/bash
SSH_HOST := root@147.93.63.131
LOCAL_PORT := 8080
REMOTE_PORT := 8080

# Default target
all: help

# Help target
help:
	@echo "Available targets:"
	@echo "  forward    - Set up an SSH tunnel with port forwarding."

# Forward target
forward:
	@echo "Setting up SSH tunnel with port forwarding..."
	ssh -NT -L $(LOCAL_PORT):localhost:$(REMOTE_PORT) $(SSH_HOST)

