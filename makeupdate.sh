#!/bin/bash

# ============================================================
# Makefile Update Script
#
# Directory structure:
#
#   .
#   ├── templates/
#   │   └── Makefile
#   ├── category_a/
#   │   ├── project1/
#   │   │   └── Makefile
#   │   └── project2/
#   │       └── Makefile
#   ├── category_b/
#   │   └── project3/
#   │       └── Makefile
#   └── update_makefile.sh
# ============================================================


# ------------------------------------------------------------
# Configuration
# ------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

TEMPLATE_DIR="$SCRIPT_DIR/templates"
TEMPLATE_MAKEFILE="$TEMPLATE_DIR/Makefile"


# ------------------------------------------------------------
# Check template
# ------------------------------------------------------------

if [ ! -f "$TEMPLATE_MAKEFILE" ]; then
    echo "Error: template Makefile not found:"
    echo "  $TEMPLATE_MAKEFILE"
    exit 1
fi


# ------------------------------------------------------------
# Update Makefiles
# ------------------------------------------------------------

for GROUP_DIR in "$SCRIPT_DIR"/*; do

    # Skip non-directories
    if [ ! -d "$GROUP_DIR" ]; then
        continue
    fi

    # Skip templates directory
    if [ "$GROUP_DIR" = "$TEMPLATE_DIR" ]; then
        continue
    fi


    # --------------------------------------------------------
    # Process project directories
    # --------------------------------------------------------

    for PROJECT_DIR in "$GROUP_DIR"/*; do

        # Skip non-directories
        if [ ! -d "$PROJECT_DIR" ]; then
            continue
        fi

        # Skip directories without a Makefile
        if [ ! -f "$PROJECT_DIR/Makefile" ]; then
            continue
        fi

        echo "Updating: $(basename "$GROUP_DIR")/$(basename "$PROJECT_DIR")"

        cp "$TEMPLATE_MAKEFILE" "$PROJECT_DIR/Makefile"
    done
done


echo "Makefile update completed."