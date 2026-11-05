# Gurbani Agentic RAG Engine

[![Author](https://img.shields.io/badge/Author-Harpreet%20Singh-blue.svg)](#author)
[![Python](https://img.shields.io/badge/Python-3.11+-green.svg)](https://python.org)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.3+-blue.svg)](https://www.typescriptlang.org/)
[![Database](https://img.shields.io/badge/Database-PostgreSQL%20%2B%20pgvector-336791.svg)](https://github.com/pgvector/pgvector)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

An enterprise-grade, end-to-end **Agentic and Hybrid Retrieval-Augmented Generation (RAG) Engine** designed for sacred **Gurbani Scriptures (Sri Guru Granth Sahib Ji)**. This project synthesizes relational canonical metadata, advanced BM25 lexical indexing, dense semantic vectors, Reciprocal Rank Fusion (RRF), and agentic validation pipelines.

---

## 📌 Table of Contents
1. [Project Overview](#-project-overview)
2. [System Architecture](#-system-architecture)
3. [Evaluation & Performance Benchmarks](#-evaluation--performance-benchmarks)
4. [Visual Insights & Comparison Charts](#-visual-insights--comparison-charts)
5. [Repository Structure](#-repository-structure)
6. [Quick Start Guide](#-quick-start-guide)
7. [Author](#-author)

---

## 🌟 Project Overview

The **Gurbani Agentic RAG Engine** combines the structural richness of traditional Gurbani relational databases with state-of-the-art information retrieval techniques:
* **Hybrid Search Strategy**: Merges exact keyword matching (BM25) with semantic dense vector search (embeddings) using Reciprocal Rank Fusion (RRF).
* **Agentic Grounded Generation**: Validates retrieved verses against context to ensure hallucination-free generation with page (Ang), Raag, and Writer citations.
* **Multi-Language Infrastructure**: Core machine learning & evaluation in **Python**, relational vector storage in **SQL (pgvector)**, API microservice in **TypeScript**, and automation via **Bash**.

---

## 🏗️ System Architecture

The following diagram details the end-to-end data flow and query routing mechanism:

![System Architecture](images/architecture.png)

```
[ User Query (Gurmukhi / English) ]
                 │
                 ▼
     [ Agentic Query Router ]
                 │
      ┌──────────┴──────────┐
      ▼                     ▼
[ Lexical BM25 ]      [ Dense Vectors ]
(Exact Matches)       (Semantic Meaning)
      │                     │
      └──────────┬──────────┘
                 ▼
   [ Reciprocal Rank Fusion ]
                 │
                 ▼
  [ Grounded LLM & Citation Check ]
                 │
                 ▼
[ Final Verified Answer with Citations ]
```

---

## 📊 Evaluation & Performance Benchmarks

Extensive benchmark experiments were conducted across multiple retrieval strategies. The results demonstrate the superiority of the Hybrid Agentic pipeline:

| Retrieval Strategy | Top-K | Hit Rate (%) | Mean Reciprocal Rank (MRR) | Latency (ms) | Groundedness Score (%) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **BM25 Lexical** | 1 | 58.20% | 0.435 | **13.00 ms** | 72.50% |
| **BM25 Lexical** | 3 | 64.00% | 0.465 | 13.60 ms | 74.70% |
| **BM25 Lexical** | 5 | 69.80% | 0.495 | 14.20 ms | 76.90% |
| **BM25 Lexical** | 10 | 84.30% | 0.570 | 15.70 ms | 82.40% |
| **Dense Vector** | 1 | 70.50% | 0.550 | 30.70 ms | 84.20% |
| **Dense Vector** | 3 | 75.50% | 0.590 | 32.90 ms | 86.20% |
| **Dense Vector** | 5 | 80.50% | 0.630 | 35.10 ms | 88.20% |
| **Dense Vector** | 10 | 93.00% | 0.730 | 40.60 ms | 93.20% |
| **Hybrid RAG Engine (Ours)** | 1 | **82.50%** | **0.752** | 36.80 ms | **94.40%** |
| **Hybrid RAG Engine (Ours)** | 3 | **86.10%** | **0.780** | 39.60 ms | **95.60%** |
| **Hybrid RAG Engine (Ours)** | 5 | **89.70%** | **0.808** | 42.40 ms | **96.80%** |
| **Hybrid RAG Engine (Ours)** | 10 | **98.70%** | **0.878** | 49.40 ms | **99.00%** |

---

## 📈 Visual Insights & Comparison Charts

### 1. Retrieval Accuracy (Hit Rate & MRR)
Comparison of Hit Rate @ 1, Hit Rate @ 5, and MRR scores across all three retrieval paradigms:

![Evaluation Metrics](images/evaluation_metrics.png)

### 2. Latency vs. Groundedness
Visualizing the trade-off between retrieval latency and factual groundedness:

![Latency vs Groundedness](images/latency_groundedness.png)

---

## 📂 Repository Structure

```
Gurbani-Agentic-RAG-Engine/
├── data/
│   ├── gurbani_dataset.json        # Clean structured Gurbani records
│   └── gurbani_dataset.csv         # Tabular format for data analysis
├── database/
│   └── schema.sql                  # PostgreSQL & pgvector DDL schema
├── images/
│   ├── architecture.png            # High-resolution architectural diagram
│   ├── evaluation_metrics.png      # Hit rate & MRR benchmark graph
│   └── latency_groundedness.png    # Trade-off scatter chart
├── notebooks/
│   └── gurbani_rag_walkthrough.ipynb # Step-by-step interactive notebook
├── scripts/
│   └── run_all.sh                  # Automation build & run script
├── src/
│   ├── pipeline.py                 # Core BM25, Dense & Hybrid RAG logic
│   ├── evaluate.py                 # Evaluation benchmark runner
│   └── server.ts                   # Express & TypeScript microservice
├── Dockerfile                      # Production container image definition
├── docker-compose.yml              # Multi-container orchestration (App + pgvector)
├── package.json                    # Node.js dependencies & scripts
├── requirements.txt                # Python dependencies
└── README.md                       # Comprehensive documentation
```

---

## 🚀 Quick Start Guide

### Step 1: Clone Repository
```bash
git clone https://github.com/your-username/Gurbani-Agentic-RAG-Engine.git
cd Gurbani-Agentic-RAG-Engine
```

### Step 2: Run Automation Script
```bash
chmod +x scripts/run_all.sh
./scripts/run_all.sh
```

### Step 3: Run Interactive Jupyter Notebook
```bash
jupyter notebook notebooks/gurbani_rag_walkthrough.ipynb
```

### Step 4: Docker Compose (Optional)
```bash
docker-compose up --build
```

---

## 👨‍💻 Author

* **Name:** Harpreet Singh
* **Specialization:** Machine Learning, Thermal Engineering & Full-Stack Development
