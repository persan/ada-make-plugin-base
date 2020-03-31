load lib/libmakepluginsample.so
EXPAND="Expanded Value"
all:
	@echo "=========================================="
	@echo $(magic 1)
	@echo $(magic2 1, 2, 3 4)
	@echo $(expand 1)
	@echo "=========================================="
#	@echo $(testeval 1)

