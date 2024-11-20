##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '37a0f65eec2ac6dbab629528e702a057574b6d3c'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/final-project-Sriram-Y.git'
AESD_ASSIGNMENTS_SITE_METHOD = git

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(info Using cross-compiler: arm-none-linux-gnueabihf-gcc)
	$(MAKE) -C $(@D)/build clean
	$(MAKE) -C $(@D)/build \
		CC=arm-none-linux-gnueabihf-gcc \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(info $(INSTALL))
	$(INSTALL) -m 0755 $(@D)/audioeqdriver $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scripts/audioeqdriver-start-stop.sh $(TARGET_DIR)/etc/init.d/S99audioeqdriver
endef

$(eval $(generic-package))
