# Citation Management Guide

## Overview

This manuscript uses **Pandoc with BibTeX** for citation management, similar to LaTeX. Citations are stored in `references.bib` and referenced using citation keys in the manuscript.

---

## Quick Start

### 1. Install Pandoc

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install pandoc pandoc-citeproc texlive-latex-base texlive-fonts-recommended
```

**macOS:**
```bash
brew install pandoc
brew install --cask mactex  # For PDF output
```

**Check installation:**
```bash
pandoc --version
```

### 2. Compile the Manuscript

**Generate PDF (default):**
```bash
./compile.sh
# or
./compile.sh pdf
```

**Generate Word document:**
```bash
./compile.sh docx
```

**Generate HTML:**
```bash
./compile.sh html
```

**Generate all formats:**
```bash
./compile.sh all
```

---

## How Citations Work

### Citation Syntax

In `MANUSCRIPT.md`, use Pandoc citation syntax:

| Syntax | Output | Usage |
|--------|--------|-------|
| `[@satoh2009]` | (Satoh et al. 2009) | Single citation |
| `[@satoh2009; @wang2024]` | (Satoh et al. 2009; Wang et al. 2024) | Multiple citations |
| `@satoh2009` | Satoh et al. (2009) | In-text citation |
| `[-@satoh2009]` | (2009) | Suppress author names |

### Examples

**Before (numbered):**
```markdown
First described in 2009 [1], C. auris has spread worldwide.
```

**After (with citation keys):**
```markdown
First described in 2009 [@satoh2009], C. auris has spread worldwide.
```

**Multiple references:**
```markdown
CDC and WHO classify C. auris as urgent threat [@cdc2023threat; @who2024fungal].
```

**In-text (author-year):**
```markdown
@santana2023 demonstrated that SCF1 governs colonization.
```

---

## Managing References

### BibTeX File Structure

All references are in `references.bib`. Each entry has:
- **Type**: `@article`, `@misc`, `@book`, etc.
- **Citation key**: Unique identifier (e.g., `satoh2009`)
- **Fields**: author, title, journal, year, doi, url, etc.

### Example Entry

```bibtex
@article{satoh2009,
  author = {Satoh, Kazuo and Makimura, Koichi and others},
  title = {\textit{Candida auris} sp. nov., a novel ascomycetous yeast},
  journal = {Microbiology and Immunology},
  year = {2009},
  volume = {53},
  number = {1},
  pages = {41--44},
  doi = {10.1111/j.1348-0421.2008.00083.x},
  url = {https://pubmed.ncbi.nlm.nih.gov/19161556/}
}
```

### Adding New References

1. **Find BibTeX entry:**
   - PubMed: Click "Cite" → "BibTeX"
   - Google Scholar: Click quote icon → "BibTeX"
   - DOI: Use https://www.doi2bib.org/

2. **Add to `references.bib`:**
   ```bash
   nano references.bib
   # Paste entry at end of file
   ```

3. **Use in manuscript:**
   ```markdown
   Recent study [@newpaper2025] demonstrates...
   ```

4. **Recompile:**
   ```bash
   ./compile.sh
   ```

### Citation Key Naming Convention

Current convention: `firstauthor+year`

Examples:
- `satoh2009` - Satoh et al. 2009
- `santana2023` - Santana et al. 2023
- `wang2024` - Wang et al. 2024
- `cdc2023threat` - CDC 2023 threat report
- `iwc2024` - IWC workflows 2024

For organization/agency reports, use: `org+year+keyword`

---

## Reference Formatting

### Current Style

Default: **author-year** (similar to Nature/Science)

To change citation style, download CSL file from https://github.com/citation-style-language/styles

**Popular styles:**
- `nature.csl` - Nature journal style
- `science.csl` - Science journal style
- `apa.csl` - APA style
- `vancouver.csl` - Vancouver (numbered) style

**Use custom style:**
```bash
# Download CSL file
wget https://raw.githubusercontent.com/citation-style-language/styles/master/nature.csl

# Compile with style
pandoc MANUSCRIPT.md \
    --bibliography=references.bib \
    --citeproc \
    --csl=nature.csl \
    --output=MANUSCRIPT.pdf
```

**Edit `compile.sh` to use style permanently:**
```bash
# Add this line after --citeproc:
--csl=nature.csl \
```

---

## Advanced Features

### Suppress Author in Multiple Citations

```markdown
Studies show this effect [@satoh2009; @santana2023].
# Output: (Satoh et al. 2009; Santana et al. 2023)

Studies show this effect [-@satoh2009; -@santana2023].
# Output: (2009; 2023)
```

### Add Prefix/Suffix

```markdown
[see @satoh2009, pp. 41-44]
# Output: (see Satoh et al. 2009, pp. 41-44)

[@satoh2009 and others]
# Output: (Satoh et al. 2009 and others)
```

### Citing Specific Pages

```markdown
[@wang2024, p. 6490]
# Output: (Wang et al. 2024, p. 6490)
```

### Figure/Table References

For cross-references within document:
```markdown
As shown in Figure 1, ...

[**Figure 1**]: #figure-1
```

---

## Checking References

### List all citations used

```bash
grep -oP '@\w+' MANUSCRIPT.md | sort -u
```

### Find unused references

```bash
# List all keys in .bib file
grep "^@" references.bib | grep -oP '\{.*,' | tr -d '{,' > /tmp/all_refs.txt

# List all keys used in manuscript
grep -oP '@\w+' MANUSCRIPT.md | sort -u | tr -d '@' > /tmp/used_refs.txt

# Find unused
comm -23 <(sort /tmp/all_refs.txt) <(sort /tmp/used_refs.txt)
```

### Validate BibTeX syntax

```bash
# Check for common errors
grep -n "^@" references.bib | head -20
```

---

## Troubleshooting

### "Citation not found" error

**Problem:** Pandoc can't find citation key

**Solution:**
1. Check spelling: `@satoh2009` not `@Satoh2009` (case-sensitive)
2. Check key exists in `references.bib`
3. Remove spaces: `[@satoh2009]` not `[ @satoh2009 ]`

### PDF won't compile

**Problem:** LaTeX errors

**Solutions:**
1. Install full LaTeX: `sudo apt-get install texlive-full`
2. Use DOCX instead: `./compile.sh docx`
3. Check error messages in terminal

### References not appearing

**Problem:** `references.bib` not found

**Solution:**
```bash
# Check file is in same directory as MANUSCRIPT.md
ls -l references.bib

# Check compile.sh points to correct file
grep "bibliography" compile.sh
```

### Wrong citation style

**Problem:** Citations appear as numbers, but want author-year

**Solution:**
- Default pandoc uses author-year
- To force numbered style, add CSL file:
  ```bash
  pandoc ... --csl=vancouver.csl ...
  ```

---

## Workflow Summary

### Daily Use

1. **Edit manuscript:**
   ```bash
   nano MANUSCRIPT.md
   # Add citations: [@key2024]
   ```

2. **Add references as needed:**
   ```bash
   nano references.bib
   # Paste BibTeX entry
   ```

3. **Compile and check:**
   ```bash
   ./compile.sh pdf
   evince MANUSCRIPT.pdf  # or open MANUSCRIPT.pdf
   ```

### Before Submission

1. **Generate all formats:**
   ```bash
   ./compile.sh all
   ```

2. **Check all citations used:**
   ```bash
   grep -oP '@\w+' MANUSCRIPT.md | sort -u
   ```

3. **Validate bibliography:**
   ```bash
   pandoc MANUSCRIPT.md --bibliography=references.bib --citeproc -t plain -o /dev/null
   ```

---

## Comparison with LaTeX

| Feature | LaTeX | Pandoc+BibTeX |
|---------|-------|---------------|
| Citation syntax | `\cite{key}` | `[@key]` |
| Bibliography file | `.bib` | `.bib` (same!) |
| Compile command | `pdflatex + bibtex` | `pandoc --citeproc` |
| Output formats | PDF, DVI | PDF, DOCX, HTML, etc. |
| Learning curve | Steep | Gentle |
| Markdown support | Via packages | Native |

**Key advantage:** Same `.bib` file works with both LaTeX and Pandoc!

---

## Resources

- **Pandoc manual:** https://pandoc.org/MANUAL.html#citations
- **CSL styles:** https://github.com/citation-style-language/styles
- **BibTeX guide:** http://www.bibtex.org/Format/
- **Citation examples:** https://pandoc.org/demo/example19/Extension-citations.html
- **DOI to BibTeX:** https://www.doi2bib.org/

---

## Quick Reference Card

```markdown
# In MANUSCRIPT.md:

Single citation:        [@key]
Multiple citations:     [@key1; @key2; @key3]
In-text citation:       @key showed that...
Suppress author:        [-@key]
With page numbers:      [@key, pp. 10-15]
With prefix:            [see @key]
With suffix:            [@key, and others]

# In terminal:

Compile to PDF:         ./compile.sh
Compile to Word:        ./compile.sh docx
Compile to HTML:        ./compile.sh html
Compile all:            ./compile.sh all

# Add new reference:

1. Find BibTeX entry (PubMed, Google Scholar)
2. Add to references.bib
3. Use citation key in manuscript: [@newkey2025]
4. Recompile: ./compile.sh
```

---

*Guide created: December 3, 2025*
*For manuscript: Standardizing RNA-seq Analysis of Fungal Pathogens Using BRC-Analytics*
