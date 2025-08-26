# The Last Hearth

An interactive fiction about loss, survival and indifference.

**Play online**: https://vipulvpatil.github.io/the-last-hearth/

## Building

**Prerequisites**: Requires [inkjs](https://github.com/y-lohse/inkjs) for compilation.

To compile the ink stories to JSON format:

```bash
make          # Build all stories
make clean    # Remove compiled files
make rebuild  # Clean and rebuild all stories
```

Stories are compiled from `story/*.ink` to `public/chapters/*.json`.

## Running

Open `index.html` in a web browser or serve the `public` directory with a web server.

## Project Structure

- **Source**: `story/` - Contains the original ink story files
- **Output**: `public/chapters/` - Contains compiled JSON story data
- **Web**: `public/` - Web assets for the interactive story player