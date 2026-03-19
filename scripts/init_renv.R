# ============================================================
# init_renv.R – Einmalig im Projektordner in RStudio ausführen
# ============================================================
# Dieses Skript:
#   1. Installiert renv (falls noch nicht vorhanden)
#   2. Initialisiert renv für dieses Projekt
#   3. Installiert alle benötigten Pakete
#   4. Erstellt renv.lock mit genauen Versionen
#
# Ausführen: source("scripts/init_renv.R")
# Danach RStudio neu starten.
# ============================================================

stopifnot(R.version$major >= 4)

# 1. renv sicherstellen ------------------------------------------
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv", repos = "https://cran.rstudio.com/")
}

# 2. renv initialisieren (erzeugt .Rprofile + renv/activate.R) ---
renv::init(bare = TRUE)

# 3. Pakete installieren -----------------------------------------
pkgs <- c(
  "tidyverse",   # dplyr, ggplot2, readr, tibble, tidyr, purrr, …
  "readxl",      # Excel einlesen
  "openxlsx",    # Excel schreiben
  "rmarkdown",   # R Notebooks rendern
  "knitr",       # Chunk-Ausgabe
  "here"         # robuste Pfade
)

renv::install(pkgs)

# 4. Snapshot – erzeugt renv.lock --------------------------------
renv::snapshot()

message("\n✓ renv.lock erstellt. RStudio jetzt neu starten.")
message("  Zukünftig: renv::restore() stellt alle Pakete wieder her.")
