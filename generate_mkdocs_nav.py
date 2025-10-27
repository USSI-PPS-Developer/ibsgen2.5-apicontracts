#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Auto-generate nav section in mkdocs.yml from api-contracts/ structure
Author:PT USSI Pinbuk Prima Software
"""

import os
import yaml
from pathlib import Path

BASE_DIR = Path(__file__).parent
MKDOCS_FILE = BASE_DIR / "mkdocs.yml"
CONTRACTS_DIR = BASE_DIR / "api-contracts"

def build_nav():
    nav = [{"Beranda": "index.md"}]

    # iterate categories
    for category in sorted(CONTRACTS_DIR.iterdir()):
        if category.is_dir():
            section = []
            for f in sorted(category.glob("*.md")):
                name = f.stem.replace("-", " ").title()
                relpath = f.relative_to(CONTRACTS_DIR).as_posix()
                section.append({name: relpath})
            nav.append({category.name.replace("-", " ").title(): section})
    return nav

def update_mkdocs(nav):
    with open(MKDOCS_FILE, "r", encoding="utf-8") as f:
        config = yaml.safe_load(f)

    config["nav"] = nav

    with open(MKDOCS_FILE, "w", encoding="utf-8") as f:
        yaml.dump(config, f, sort_keys=False, allow_unicode=True)

    print(f"✅ Updated nav in {MKDOCS_FILE}")

def main():
    if not MKDOCS_FILE.exists():
        print("❌ mkdocs.yml not found.")
        return
    if not CONTRACTS_DIR.exists():
        print("❌ api-contracts/ folder not found. Run make docs first.")
        return

    nav = build_nav()
    update_mkdocs(nav)
    print("✨ mkdocs.yml navigation updated successfully!")

if __name__ == "__main__":
    main()