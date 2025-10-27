#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Auto-generate nav section in mkdocs.yml from api-contracts/ structure
with automatic sorting & grouping
Author: PT USSI Pinbuk Prima Software
"""

import os
import yaml
from pathlib import Path

BASE_DIR = Path(__file__).parent
MKDOCS_FILE = BASE_DIR / "mkdocs.yml"
CONTRACTS_DIR = BASE_DIR / "api-contracts"

def build_nav():
    """Bangun struktur nav berdasarkan isi folder api-contracts"""
    nav = [{"Beranda": "index.md"}]

    # Loop per kategori (folder)
    for category in sorted(CONTRACTS_DIR.iterdir()):
        if category.is_dir():
            section = []
            # Ambil file markdown di tiap folder
            for f in sorted(category.glob("*.md")):
                name = f.stem.replace("-", " ").title()
                relpath = f.relative_to(CONTRACTS_DIR).as_posix()
                section.append