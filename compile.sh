#!/bin/bash
# Compile MANUSCRIPT.md to various formats using Pandoc
# Requires: pandoc, pandoc-citeproc (or pandoc >= 2.11 with built-in citeproc)

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Compiling C. auris Manuscript ===${NC}\n"

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo -e "${RED}Error: pandoc is not installed${NC}"
    echo "Install with: sudo apt-get install pandoc (Ubuntu/Debian)"
    echo "            or: brew install pandoc (macOS)"
    exit 1
fi

# Check pandoc version
PANDOC_VERSION=$(pandoc --version | head -n1)
echo -e "Using: ${GREEN}$PANDOC_VERSION${NC}"

# Determine citation processing method based on version
PANDOC_MAJOR=$(pandoc --version | head -n1 | grep -oP '\d+\.\d+' | head -n1 | cut -d. -f1)
PANDOC_MINOR=$(pandoc --version | head -n1 | grep -oP '\d+\.\d+' | head -n1 | cut -d. -f2)

if [ "$PANDOC_MAJOR" -gt 2 ] || ([ "$PANDOC_MAJOR" -eq 2 ] && [ "$PANDOC_MINOR" -ge 11 ]); then
    CITE_OPTION="--citeproc"
    echo -e "Citation processing: ${GREEN}built-in citeproc${NC}\n"
else
    CITE_OPTION="--filter pandoc-citeproc"
    echo -e "Citation processing: ${GREEN}pandoc-citeproc filter${NC}\n"
fi

# Default: compile to PDF
OUTPUT_FORMAT=${1:-pdf}

case $OUTPUT_FORMAT in
    pdf)
        echo -e "${BLUE}Compiling to PDF...${NC}"

        # Use Vancouver brackets style if available, otherwise default
        CSL_FILE=""
        if [ -f "vancouver-brackets.csl" ]; then
            CSL_FILE="--csl=vancouver-brackets.csl"
            echo -e "Citation style: ${GREEN}Vancouver (numbered)${NC}"
        fi

        pandoc MANUSCRIPT.md \
            --bibliography=references.bib \
            $CITE_OPTION \
            $CSL_FILE \
            --from=markdown \
            --to=pdf \
            --output=MANUSCRIPT.pdf \
            --pdf-engine=pdflatex \
            --variable=geometry:margin=1in \
            --variable=fontsize:11pt \
            --variable=documentclass:article

        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ PDF created: MANUSCRIPT.pdf${NC}"
        else
            echo -e "${RED}✗ PDF compilation failed${NC}"
            exit 1
        fi
        ;;

    docx)
        echo -e "${BLUE}Compiling to DOCX...${NC}"

        # Use Vancouver brackets style if available
        CSL_FILE=""
        if [ -f "vancouver-brackets.csl" ]; then
            CSL_FILE="--csl=vancouver-brackets.csl"
            echo -e "Citation style: ${GREEN}Vancouver (numbered)${NC}"
        fi

        pandoc MANUSCRIPT.md \
            --bibliography=references.bib \
            $CITE_OPTION \
            $CSL_FILE \
            --from=markdown \
            --to=docx \
            --output=MANUSCRIPT.docx \
            --reference-doc=custom-reference.docx 2>/dev/null || \
        pandoc MANUSCRIPT.md \
            --bibliography=references.bib \
            $CITE_OPTION \
            $CSL_FILE \
            --from=markdown \
            --to=docx \
            --output=MANUSCRIPT.docx

        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ DOCX created: MANUSCRIPT.docx${NC}"
        else
            echo -e "${RED}✗ DOCX compilation failed${NC}"
            exit 1
        fi
        ;;

    html)
        echo -e "${BLUE}Compiling to HTML...${NC}"

        # Use Vancouver brackets style if available
        CSL_FILE=""
        if [ -f "vancouver-brackets.csl" ]; then
            CSL_FILE="--csl=vancouver-brackets.csl"
            echo -e "Citation style: ${GREEN}Vancouver (numbered)${NC}"
        fi

        pandoc MANUSCRIPT.md \
            --bibliography=references.bib \
            $CITE_OPTION \
            $CSL_FILE \
            --from=markdown \
            --to=html5 \
            --output=MANUSCRIPT.html \
            --standalone \
            --css=style.css 2>/dev/null || \
        pandoc MANUSCRIPT.md \
            --bibliography=references.bib \
            $CITE_OPTION \
            $CSL_FILE \
            --from=markdown \
            --to=html5 \
            --output=MANUSCRIPT.html \
            --standalone

        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ HTML created: MANUSCRIPT.html${NC}"
        else
            echo -e "${RED}✗ HTML compilation failed${NC}"
            exit 1
        fi
        ;;

    all)
        echo -e "${BLUE}Compiling to all formats...${NC}\n"
        bash compile.sh pdf && \
        bash compile.sh docx && \
        bash compile.sh html

        if [ $? -eq 0 ]; then
            echo -e "\n${GREEN}✓ All formats compiled successfully${NC}"
        fi
        ;;

    *)
        echo -e "${RED}Unknown format: $OUTPUT_FORMAT${NC}"
        echo "Usage: ./compile.sh [pdf|docx|html|all]"
        echo "Default: pdf"
        exit 1
        ;;
esac

echo ""
