GHC=ghc
SRC=main.hs
EPREUVE_SRC=$(wildcard epreuve/*.hs)
TARGET=main
OUTDIR=load

all: clean compil run

compil: $(EPREUVE_SRC)
	@[ ! -d $(OUTDIR) ] && mkdir -p $(OUTDIR) && echo "Dossier 'load' créé"
	@$(GHC) $(SRC) $(EPREUVE_SRC) -o $(OUTDIR)/$(TARGET) -outputdir $(OUTDIR)

run: $(OUTDIR)/$(TARGET)
	@./$(OUTDIR)/$(TARGET)

clean:
	@rm -rf $(OUTDIR)
