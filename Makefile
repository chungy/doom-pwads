# Create PWADs of Doom's levels
#
# Requires DeuTex to run. Make sure your IWADs are not in the current
# working directory!

DEUTEX=deutex
DEUTEX_ARGS=-v0 -doom2 bootstrap/

# Change this if your IWADs are located elsewhere.
DOOMWADDIR?=/usr/share/games/doom

# Default to just building all of them
default: doom.wad doom2.wad tnt.wad plutonia.wad
all: default doom1.wad

bootstrap::
	$(MAKE) -C bootstrap

# Shareware Doom, for completion's sake, but not built by default.
doom1.wad: bootstrap
	@echo "Extracting IWAD $@"
	@mkdir -p wads doom1
	@$(DEUTEX) $(DEUTEX_ARGS) -dir doom1 -levels -lumps -extract $(DOOMWADDIR)/$@
	@sed -i -e '/PLAYPAL/d;/COLORMAP/d;/ENDOOM/d;/GENMIDI/d;/DMXGUS/d' doom1/wadinfo.txt
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -dir doom1 -make wads/$@

# Ultimate Doom
doom.wad: bootstrap
	@echo "Extracting IWAD $@"
	@mkdir -p wads doom
	@$(DEUTEX) $(DEUTEX_ARGS) -dir doom -levels -lumps -extract $(DOOMWADDIR)/$@
	@sed -i -e '/PLAYPAL/d;/COLORMAP/d;/ENDOOM/d;/GENMIDI/d;/DMXGUS/d' doom/wadinfo.txt
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -dir doom -make wads/$@

# Doom II
doom2.wad: bootstrap
	@echo "Extracting IWAD $@"
	@mkdir -p wads doom2
	@$(DEUTEX) $(DEUTEX_ARGS) -dir doom2 -levels -lumps -extract $(DOOMWADDIR)/$@
	@sed -i -e '/PLAYPAL/d;/COLORMAP/d;/ENDOOM/d;/GENMIDI/d;/DMXGUSC/d' doom2/wadinfo.txt
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -dir doom2 -make wads/$@

# Final Doom: TNT Evilution
tnt.wad: bootstrap
	@echo "Extracting IWAD $@"
	@mkdir -p wads tnt
	@$(DEUTEX) $(DEUTEX_ARGS) -dir tnt -levels -lumps -extract $(DOOMWADDIR)/$@
	@sed -i -e '/PLAYPAL/d;/COLORMAP/d;/ENDOOM/d;/GENMIDI/d;/DMXGUSC/d;/_DEUTEX_/d' tnt/wadinfo.txt
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -dir tnt -make wads/$@

# Final Doom: The Plutonia Experiment
plutonia.wad: bootstrap
	@echo "Extracting IWAD $@"
	@mkdir -p wads plutonia
	@$(DEUTEX) $(DEUTEX_ARGS) -doom2 $(DOOMWADDIR)/$@ -dir plutonia -levels -lumps -extract $(DOOMWADDIR)/$@
	@sed -i -e '/PLAYPAL/d;/COLORMAP/d;/ENDOOM/d;/GENMIDI/d;/DMXGUSC/d;/_DEUTEX_/d' plutonia/wadinfo.txt
	@echo "Composing PWAD $@"
	@$(DEUTEX) $(DEUTEX_ARGS) -dir plutonia -make wads/$@

clean:
	$(RM) -r *.wad wads doom doom1 doom2 tnt plutonia
	$(MAKE) -C bootstrap clean
