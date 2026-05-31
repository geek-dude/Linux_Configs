#!/bin/sh

# lf preview script
# lf passes:
#   $1 = file path
#   $2 = preview pane width in terminal cells
#   $3 = preview pane height in terminal cells
#   $4 = horizontal position
#   $5 = vertical position

CACHE_DIR="$HOME/.cache/lf"
mkdir -p "$CACHE_DIR"

file="$1"

# Check file argument
if [ -z "$file" ]; then
  printf 'ERROR: previewer was called without a file argument\n'
  exit 1
fi

# Check width / height arguments and fall back if needed
if [ -z "$2" ]; then
  printf 'WARN: preview width was not passed by lf, using default width=80\n'
  width=80
else
  width="$2"
fi

if [ -z "$3" ]; then
  printf 'WARN: preview height was not passed by lf, using default height=40\n'
  height=40
else
  height="$3"
fi

# File existence check
if [ ! -e "$file" ]; then
  printf 'ERROR: file does not exist: %s\n' "$file"
  exit 1
fi

# Lowercase file name for extension matching
lower_file="$(printf '%s\n' "$file" | tr '[:upper:]' '[:lower:]')"
mime="$(file -Lb --mime-type -- "$file")"

# Cache key
hash="$(printf '%s' "$file" | md5sum | awk '{print $1}')"
cache_base="$CACHE_DIR/thumb.$hash"

img() {
  if ! command -v chafa >/dev/null 2>&1; then
    printf 'ERROR: chafa is not installed or not in PATH\n'
    printf 'Install it with:\n'
    printf '  sudo apt install chafa\n'
    exit 1
  fi

  chafa \
    -f sixel \
    -s "${width}x${height}" \
    --animate off \
    --polite on \
    -t 1 \
    --bg black \
    "$1"

  # Important for lf image preview behavior
  exit 1
}

text() {
  if command -v bat >/dev/null 2>&1; then
    bat --color=always --style=plain --pager=never -- "$1"
  else
    cat -- "$1"
  fi
}

case "$lower_file" in
# -------------------------
# Archives
# -------------------------
*.zip)
  if ! command -v unzip >/dev/null 2>&1; then
    printf 'ERROR: unzip is not installed\n'
    printf 'Install it with:\n'
    printf '  sudo apt install unzip\n'
    exit 1
  fi
  unzip -l -- "$file"
  ;;

*.tar | *.tgz | *.tar.gz | *.tbz2 | *.tar.bz2 | *.txz | *.tar.xz)
  if ! command -v tar >/dev/null 2>&1; then
    printf 'ERROR: tar is not installed\n'
    exit 1
  fi
  tar tf -- "$file"
  ;;

*.7z)
  if ! command -v 7z >/dev/null 2>&1; then
    printf 'ERROR: 7z is not installed\n'
    printf 'Install it with:\n'
    printf '  sudo apt install p7zip-full\n'
    exit 1
  fi
  7z l -- "$file"
  ;;

*.rar)
  if ! command -v unrar >/dev/null 2>&1; then
    printf 'ERROR: unrar is not installed\n'
    printf 'Install it with:\n'
    printf '  sudo apt install unrar\n'
    exit 1
  fi
  unrar l -- "$file"
  ;;

# -------------------------
# SVG
# -------------------------
*.svg)
  cache_img="${cache_base}.png"

  if [ ! -f "$cache_img" ]; then
    if command -v magick >/dev/null 2>&1; then
      magick -- "$file" "$cache_img" 2>/dev/null
    elif command -v convert >/dev/null 2>&1; then
      convert -- "$file" "$cache_img" 2>/dev/null
    else
      printf 'ERROR: neither magick nor convert is installed for SVG preview\n'
      printf 'Install ImageMagick with:\n'
      printf '  sudo apt install imagemagick\n'
      exit 1
    fi
  fi

  if [ -f "$cache_img" ]; then
    img "$cache_img"
  else
    printf 'ERROR: failed to convert SVG for preview\n'
    exit 1
  fi
  ;;

# -------------------------
# PDF
# -------------------------
*.pdf)
  cache_img="${cache_base}.jpg"

  if [ ! -f "$cache_img" ]; then
    if ! command -v pdftoppm >/dev/null 2>&1; then
      printf 'ERROR: pdftoppm is not installed\n'
      printf 'Install it with:\n'
      printf '  sudo apt install poppler-utils\n'
      exit 1
    fi

    pdftoppm -jpeg -f 1 -singlefile -- "$file" "$cache_base" >/dev/null 2>&1
  fi

  if [ -f "$cache_img" ]; then
    img "$cache_img"
  else
    printf 'ERROR: failed to render PDF preview\n'
    exit 1
  fi
  ;;

# -------------------------
# Video
# -------------------------
*.mp4 | *.mkv | *.webm | *.avi | *.mov | *.flv | *.wmv | *.m4v)
  cache_img="${cache_base}.jpg"

  if [ ! -f "$cache_img" ]; then
    if ! command -v ffmpegthumbnailer >/dev/null 2>&1; then
      printf 'ERROR: ffmpegthumbnailer is not installed\n'
      printf 'Install it with:\n'
      printf '  sudo apt install ffmpegthumbnailer\n'
      exit 1
    fi

    ffmpegthumbnailer -i "$file" -o "$cache_img" -s 0 -q 5 >/dev/null 2>&1
  fi

  if [ -f "$cache_img" ]; then
    img "$cache_img"
  else
    printf 'ERROR: failed to generate video thumbnail\n'
    exit 1
  fi
  ;;

# -------------------------
# Direct image formats
# -------------------------
*.jpg | *.jpeg | *.png | *.webp | *.gif | *.bmp | *.tif | *.tiff | *.ico | *.avif)
  img "$file"
  ;;

# -------------------------
# Fallback by MIME
# -------------------------
*)
  case "$mime" in
  image/*)
    img "$file"
    ;;

  text/* | */json | */xml | application/javascript | application/x-sh | application/x-yaml)
    text "$file"
    ;;

  *)
    file -Lb -- "$file"
    ;;
  esac
  ;;
esac
