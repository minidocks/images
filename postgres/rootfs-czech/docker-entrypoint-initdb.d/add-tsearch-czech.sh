#!/bin/sh
set -e

$psql <<-EOSQL
  CREATE TEXT SEARCH DICTIONARY czech_spell
    (template=ispell, dictfile=czech, afffile=czech, stopwords=czech);
  CREATE TEXT SEARCH DICTIONARY czech_ispell\
    (template=ispell, dictfile=czech, afffile=czech, stopwords=czech);
  CREATE TEXT SEARCH CONFIGURATION czech (copy=english);
  ALTER TEXT SEARCH CONFIGURATION czech
    ALTER MAPPING FOR word, asciiword WITH czech_spell, simple;

  CREATE TEXT SEARCH DICTIONARY czech_spell_unaccent
    (template=ispell, dictfile = czech_unaccent, afffile=czech_unaccent, stopwords=czech_unaccent);
  CREATE TEXT SEARCH DICTIONARY czech_ispell_unaccent
    (template=ispell, dictfile = czech_unaccent, afffile=czech_unaccent, stopwords=czech_unaccent);
  CREATE TEXT SEARCH CONFIGURATION czech_unaccent (copy=english);
  ALTER TEXT SEARCH CONFIGURATION czech_unaccent
    ALTER MAPPING FOR word, asciiword WITH czech_spell_unaccent, simple;

  CREATE TEXT SEARCH DICTIONARY cs_spell
    (template=ispell, dictfile=czech, afffile=czech, stopwords=czech);
  CREATE TEXT SEARCH DICTIONARY cs_ispell
    (template=ispell, dictfile=czech, afffile=czech, stopwords=czech);
  CREATE TEXT SEARCH CONFIGURATION cs (copy=english);
  ALTER TEXT SEARCH CONFIGURATION cs
    ALTER MAPPING FOR word, asciiword WITH cs_spell, simple;

  CREATE TEXT SEARCH DICTIONARY cs_spell_unaccent
    (template=ispell, dictfile = czech_unaccent, afffile=czech_unaccent, stopwords=czech_unaccent);
  CREATE TEXT SEARCH DICTIONARY cs_ispell_unaccent
    (template=ispell, dictfile = czech_unaccent, afffile=czech_unaccent, stopwords=czech_unaccent);
  CREATE TEXT SEARCH CONFIGURATION cs_unaccent (copy=english);
  ALTER TEXT SEARCH CONFIGURATION cs_unaccent
    ALTER MAPPING FOR word, asciiword WITH czech_spell_unaccent, simple;
EOSQL
