# =========================================================
# 🏗️  IBSGen 2.5 — API Contract Generator
# Author: Azhar Zakiy Ramadhan
# =========================================================

PYTHON=python3
GENERATOR=generate_api_contracts.py
CONFIG=config.json
OUTDIR=api-contracts

# ANSI Colors
GREEN  = \033[1;32m
CYAN   = \033[1;36m
YELLOW = \033[1;33m
RESET  = \033[0m

# =========================================================
# Default Help Menu
# =========================================================
help:
	@echo ""
	@echo "$(CYAN)📘 IBSGen 2.5 API Contract Generator Commands$(RESET)"
	@echo "--------------------------------------------------"
	@echo "$(GREEN)make docs$(RESET)          → Generate semua modul (lengkap dengan SUMMARY.md)"
	@echo "$(GREEN)make docs-fast$(RESET)     → Generate cepat tanpa SUMMARY.md"
	@echo "$(GREEN)make kas$(RESET)           → Generate kategori Pengelolaan Kas"
	@echo "$(GREEN)make tabungan$(RESET)      → Generate kategori Tabungan"
	@echo "$(GREEN)make kredit$(RESET)        → Generate kategori Kredit"
	@echo "$(YELLOW)make clean$(RESET)         → Hapus hasil generate"
	@echo ""

# =========================================================
# Main Build Commands
# =========================================================
docs:
	@echo "$(CYAN)🚀 Generating ALL API Contracts (with SUMMARY.md)...$(RESET)"
	@$(PYTHON) $(GENERATOR) --output $(OUTDIR)
	@echo "$(GREEN)✅ Done. Output -> $(OUTDIR)/$(RESET)"

docs-fast:
	@echo "$(CYAN)⚡ Fast Generate (skip SUMMARY.md)...$(RESET)"
	@$(PYTHON) $(GENERATOR) --output $(OUTDIR) --no-summary
	@echo "$(GREEN)✅ Done (fast mode). Output -> $(OUTDIR)/$(RESET)"

kas:
	@echo "$(CYAN)💼 Generate: Pengelolaan Kas$(RESET)"
	@$(PYTHON) $(GENERATOR) --category "Pengelolaan Kas" --output $(OUTDIR)
	@echo "$(GREEN)✅ Done. Output -> $(OUTDIR)/pengelolaan-kas/$(RESET)"

tabungan:
	@echo "$(CYAN)🏦 Generate: Tabungan$(RESET)"
	@$(PYTHON) $(GENERATOR) --category "Tabungan" --output $(OUTDIR)
	@echo "$(GREEN)✅ Done. Output -> $(OUTDIR)/tabungan/$(RESET)"

kredit:
	@echo "$(CYAN)💰 Generate: Kredit$(RESET)"
	@$(PYTHON) $(GENERATOR) --category "Kredit" --output $(OUTDIR)
	@echo "$(GREEN)✅ Done. Output -> $(OUTDIR)/kredit/$(RESET)"

docs-serve:
	@echo "🌐 Serving MkDocs locally on http://127.0.0.1:8000"
	@mkdocs serve -f mkdocs.yml

docs-build:
	@echo "🏗️  Building MkDocs static site..."
	@mkdocs build -f mkdocs.yml -d site
	@echo "✅ Build complete → ./site"

docs-nav:
	@echo "🧭 Auto-generating MkDocs navigation..."
	@python3 generate_mkdocs_nav.py
	@echo "✅ mkdocs.yml updated with latest nav!"

# =========================================================
# Clean Output Folder
# =========================================================
clean:
	@echo "$(YELLOW)🧹 Cleaning output folder...$(RESET)"
	@rm -rf $(OUTDIR)
	@echo "$(GREEN)✅ Clean complete.$(RESET)"