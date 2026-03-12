GHC=ghc
SRC=main.hs
# On inclut tous les fichiers .hs dans les sous-dossiers de Projet
ALL_SRC=$(shell find Projet -name "*.hs")
TARGET=main
OUTDIR=load

all: clean compil run

compil:
	@[ ! -d $(OUTDIR) ] && mkdir -p $(OUTDIR) && echo "Dossier '$(OUTDIR)' créé"
	@# L'option -iProjet permet à GHC de trouver les modules dans le dossier Projet
	@$(GHC) -iProjet $(SRC) -o $(OUTDIR)/$(TARGET) -outputdir $(OUTDIR)

run: 
	@./$(OUTDIR)/$(TARGET)

clean:
	@rm -rf $(OUTDIR)