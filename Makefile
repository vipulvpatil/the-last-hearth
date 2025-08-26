# Makefile for building ink stories

# Source and output directories
STORY_DIR := story
OUTPUT_DIR := public/chapters

.PHONY: all clean rebuild help

# Build all stories
all:
	@mkdir -p $(OUTPUT_DIR)
	@for file in $(STORY_DIR)/*.ink; do \
		if [ -f "$$file" ]; then \
			basename=$$(basename "$$file" .ink); \
			output="$(OUTPUT_DIR)/$$basename.json"; \
			echo "Compiling $$file to $$output"; \
			npx inkjs "$$file" -o "$$output"; \
		fi \
	done

# Clean compiled files
clean:
	rm -rf $(OUTPUT_DIR)/*.json

# Rebuild everything
rebuild: clean all

# Help target
help:
	@echo "Available targets:"
	@echo "  all      - Build all ink stories (default)"
	@echo "  clean    - Remove compiled JavaScript files" 
	@echo "  rebuild  - Clean and rebuild all stories"
	@echo "  help     - Show this help message"