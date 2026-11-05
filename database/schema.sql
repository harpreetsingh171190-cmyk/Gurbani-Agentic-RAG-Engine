-- Gurbani Database Schema & pgvector Vector Extension
-- Author: Harpreet Singh

CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS writers (
    id SERIAL PRIMARY KEY,
    name_english VARCHAR(255) NOT NULL,
    name_gurmukhi VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS raags (
    id SERIAL PRIMARY KEY,
    name_english VARCHAR(255) NOT NULL,
    start_ang INT,
    end_ang INT
);

CREATE TABLE IF NOT EXISTS shabads (
    id SERIAL PRIMARY KEY,
    raag_id INT REFERENCES raags(id),
    writer_id INT REFERENCES writers(id),
    source VARCHAR(255) DEFAULT 'Sri Guru Granth Sahib Ji'
);

CREATE TABLE IF NOT EXISTS verses (
    id SERIAL PRIMARY KEY,
    verse_id INT UNIQUE NOT NULL,
    shabad_id INT REFERENCES shabads(id),
    line_number INT NOT NULL,
    page_ang INT NOT NULL,
    gurmukhi TEXT NOT NULL,
    translation_english TEXT NOT NULL,
    embedding vector(1536),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_verses_shabad ON verses(shabad_id);
CREATE INDEX IF NOT EXISTS idx_verses_ang ON verses(page_ang);
CREATE INDEX IF NOT EXISTS idx_verses_embedding ON verses USING ivfflat (embedding vector_cosine_ops) WITH (lists = 100);
