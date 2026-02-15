pandoc proposal.md \
  --from gfm \
  -t html \
  -c github-markdown.css \
  --pdf-engine=wkhtmltopdf \
  -o proposal.pdf

