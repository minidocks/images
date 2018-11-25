#!/bin/sh
set -e

$psql <<-EOSQL
  CREATE TEXT SEARCH DICTIONARY czech_spell
    (template=ispell, dictfile=czech, afffile=czech, stopwords=czech);
  CREATE TEXT SEARCH CONFIGURATION czech (copy=english);
  ALTER TEXT SEARCH CONFIGURATION czech
    ALTER MAPPING FOR word, asciiword WITH czech_spell, simple;
  CREATE TEXT SEARCH DICTIONARY cs_spell
    (template=ispell, dictfile=czech, afffile=czech, stopwords=czech);
  CREATE TEXT SEARCH CONFIGURATION cs (copy=english);
  ALTER TEXT SEARCH CONFIGURATION cs
    ALTER MAPPING FOR word, asciiword WITH cs_spell, simple;
EOSQL
