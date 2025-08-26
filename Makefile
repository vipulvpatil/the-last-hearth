# Makefile for building ink stories

# Source and output directories
STORY_DIR := story
OUTPUT_DIR := public/chapters

.PHONY: build clean rebuild play serve help

# Build all stories
build:
	@echo "Building all stories..."
	@mkdir -p $(OUTPUT_DIR)
	@for file in $(STORY_DIR)/*.ink; do \
		if [ -f "$$file" ]; then \
			basename=$$(basename "$$file" .ink); \
			output="$(OUTPUT_DIR)/$$basename.json"; \
			echo "Compiling $$file to $$output"; \
			npx inkjs "$$file" -o "$$output"; \
		fi \
	done
	@echo "Build complete!"

# Clean compiled files
clean:
	@echo "Cleaning compiled files..."
	@rm -rf $(OUTPUT_DIR)/*.json
	@echo "Clean complete!"

# Rebuild everything
rebuild: clean build
	@echo "Rebuild complete!"

# Play the story locally in terminal
play:
	@echo "Available chapters:"
	@i=1; for file in $(STORY_DIR)/*.ink; do \
		if [ -f "$$file" ]; then \
			basename=$$(basename "$$file" .ink); \
			echo "  $$i) $$basename"; \
			i=$$((i+1)); \
		fi \
	done
	@echo "Enter chapter number to play:"
	@read choice; \
	i=1; \
	for file in $(STORY_DIR)/*.ink; do \
		if [ -f "$$file" ]; then \
			if [ $$i -eq $$choice ]; then \
				basename=$$(basename "$$file" .ink); \
				echo "Playing: $$basename"; \
				npx inkjs "$$file" -p; \
				break; \
			fi; \
			i=$$((i+1)); \
		fi \
	done

# Serve the story locally
serve: build
	@echo "Starting web server..."
	@npx serve public

# Help target
help:
	@echo "Available targets:"
	@echo "  build    - Build all ink stories (default)"
	@echo "  play     - Play the story in terminal using inkjs"
	@echo "  serve    - Build and serve the web version locally"
	@echo "  clean    - Remove compiled JSON files" 
	@echo "  rebuild  - Clean and rebuild all stories"
	@echo "  help     - Show this help message"