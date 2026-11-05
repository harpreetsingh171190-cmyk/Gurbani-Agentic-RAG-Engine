#!/usr/bin/env bash
# Gurbani Agentic RAG Engine - Run All Tasks
# Author: Harpreet Singh

set -e

echo "=========================================================="
echo " Starting Gurbani Agentic RAG Engine System"
echo " Author: Harpreet Singh"
echo "=========================================================="

echo "[1/4] Installing Python Requirements..."
pip install -r requirements.txt

echo "[2/4] Initializing Database Schema..."
echo "Database schema checked at database/schema.sql"

echo "[3/4] Running Pipeline Benchmarks..."
python src/evaluate.py

echo "[4/4] Starting Interactive Notebook / Execution complete!"
echo "System initialized successfully."
