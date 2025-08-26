# The Last Hearth

An interactive fiction about loss, survival and indifference.

**Play online**: https://vipulvpatil.github.io/the-last-hearth/

## Building

**Prerequisites**: Requires [inkjs](https://github.com/y-lohse/inkjs) for compilation.

To compile the ink stories to JSON format:

```bash
make build    # Build all stories (default)
make play     # Play story in terminal with chapter selection
make serve    # Build and serve the web version locally
make clean    # Remove compiled files
make rebuild  # Clean and rebuild all stories
make help     # Show all available commands
```

Stories are compiled from `story/*.ink` to `public/chapters/*.json`.

## Running

Open `index.html` in a web browser or serve the `public` directory with a web server.

## Project Structure

- **Source**: `story/` - Contains the original ink story files
- **Output**: `public/chapters/` - Contains compiled JSON story data
- **Web**: `public/` - Web assets for the interactive story player