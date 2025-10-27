# 📘 IBSGen 2.5 — API Contracts Documentation

![GitHub last commit](https://img.shields.io/github/last-commit/ussi-pps-developer/ibsgen2.5-apicontracts?color=%2396BF3D&style=flat-square)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ussi-pps-developer/ibsgen2.5-apicontracts/docs.yml?label=Build%20%26%20Deploy&logo=github&style=flat-square)
![GitHub Pages](https://img.shields.io/badge/docs-live-green?style=flat-square&logo=github)

> **IBSGen 2.5 API Contracts** adalah dokumentasi modular untuk seluruh endpoint sistem IBSGen 2.5.  
> Dibangun dan dideploy otomatis menggunakan **MkDocs Material** + **GitHub Actions**, dengan navigasi dinamis dan tema _Syariah Green_ 🌿.

---

## 🌐 **Dokumentasi Online**

🔗 **Live Site:** [https://ussi-pps-developer.github.io/ibsgen2.5-apicontracts/](https://ussi-pps-developer.github.io/ibsgen2.5-apicontracts/)

---

## ⚙️ **Fitur**

✅ Auto-generate file Markdown per modul dari `config.json`  
✅ Auto-update navigasi MkDocs (`nav:`)  
✅ Tema Material dengan warna hijau Syariah  
✅ Pipeline CI/CD (Build → Deploy ke GitHub Pages)

---

## 🧩 **Struktur Folder**
```
.github/workflows/   → Workflow CI/CD (build & deploy)
api-contracts/       → Hasil generate file .md per modul
styles/              → Custom CSS tema Syariah Green
config.json          → Konfigurasi modul API
generate_api_contracts.py  → Generator file Markdown
generate_mkdocs_nav.py     → Auto-update nav di mkdocs.yml
mkdocs.yml           → Konfigurasi tema & struktur dokumentasi
```
---


🤝 Kontribusi
- Update definisi modul di config.json
- Jalankan make docs-fast
- Commit dan push ke main
- Workflow otomatis akan build & deploy versi terbaru

---

## **🏢 Dikembangkan oleh**
**PT USSI Pinbuk Prima Software**

📍 Bandung, Indonesia

💻 [https://ussi-software.com](https://ussi-software.com)

---

📜 Lisensi
Proyek ini bersifat internal dan digunakan untuk dokumentasi teknis IBSGen 2.5.
Distribusi atau modifikasi tanpa izin tertulis dari PT USSI Pinbuk Prima Software tidak diperbolehkan.