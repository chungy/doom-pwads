# Create PWADs of Doom's levels
#
# Requires DeuTex to run. Make sure your IWADs are not in the current
# working directory!

DEUTEX=deutex
DEUTEX_ARGS=-v0

# Change this if your IWADs are located elsewhere.
DOOMWADDIR?=/usr/share/games/doom

# Default to just building all of them
default: doom.wad doom2.wad tnt.wad plutonia.wad
all: default doom1.wad

# Shareware Doom, for completion's sake, but not built by default.
doom1.wad:
	@echo "Extracting IWAD $@"
	@mkdir -p wads doom1
	@$(DEUTEX) $(DEUTEX_ARGS) -doom $(DOOMWADDIR)/$@ -dir doom1 -levels -lumps -extract $(DOOMWADDIR)/$@
	@cd doom1/lumps
	@rm -f colormap.lmp dmxgus.lmp endoom.lmp genmidi.lmp playpal.lmp
	@cd ../..
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -doom $(DOOMWADDIR)/$@ -dir doom1 -make wads/$@

# Ultimate Doom
doom.wad:
	@echo "Extracting IWAD $@"
	@mkdir -p wads doom
	@$(DEUTEX) $(DEUTEX_ARGS) -doom $(DOOMWADDIR)/$@ -dir doom -levels -lumps -extract $(DOOMWADDIR)/$@
	@cd doom/lumps
	@rm -f colormap.lmp dmxgus.lmp endoom.lmp genmidi.lmp playpal.lmp
	@cd ../..
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -doom $(DOOMWADDIR)/$@ -dir doom -make wads/$@

# Doom II
doom2.wad:
	@echo "Extracting IWAD $@"
	@mkdir -p wads doom2
	@$(DEUTEX) $(DEUTEX_ARGS) -doom2 $(DOOMWADDIR)/$@ -dir doom2 -levels -lumps -extract $(DOOMWADDIR)/$@
	@cd doom2/lumps
	@rm -f colormap.lmp dmxgus.lmp endoom.lmp genmidi.lmp playpal.lmp
	@cd ../..
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -doom2 $(DOOMWADDIR)/$@ -dir doom2 -make wads/$@

# Final Doom: TNT Evilution
tnt.wad:
	@echo "Extracting IWAD $@"
	@mkdir -p wads tnt
	@$(DEUTEX) $(DEUTEX_ARGS) -doom2 $(DOOMWADDIR)/$@ -dir tnt -levels -lumps -extract $(DOOMWADDIR)/$@
	@cd tnt/lumps
	@rm -f colormap.lmp dmxgus.lmp endoom.lmp genmidi.lmp playpal.lmp
	@cd ../..
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -doom2 $(DOOMWADDIR)/$@ -dir tnt -make wads/$@

# Final Doom: The Plutonia Experiment
plutonia.wad:
	@echo "Extracting IWAD $@"
	@mkdir -p wads plutonia
	@$(DEUTEX) $(DEUTEX_ARGS) -doom2 $(DOOMWADDIR)/$@ -dir plutonia -levels -lumps -extract $(DOOMWADDIR)/$@
	@cd plutonia/lumps
	@rm -f colormap.lmp dmxgus.lmp endoom.lmp genmidi.lmp playpal.lmp _deutex_.lmp
	@cd ../..
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -doom2 $(DOOMWADDIR)/$@ -dir plutonia -make wads/$@

clean:
	rm -rf *.wad deutex.log wads doom doom1 doom2 tnt plutonia
