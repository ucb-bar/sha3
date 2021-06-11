################################################################################
#
# John the Ripper
#
################################################################################

JOHN_VERSION = riscv
JOHN_SITE = https://github.com/ucb-bar/JohnTheRipper.git
JOHN_SITE_METHOD = git
#JOHN_VERSION = 1.9.0-jumbo-1
#JOHN_SOURCE = john-$(JOHN_VERSION).tar.xz
#JOHN_SITE = https://www.openwall.com/john/k
JOHN_LICENSE = GPL-2.0
JOHN_LICENSE_FILES = doc/LICENSE doc/COPYING
JOHN_DEPENDENCIES = host-pkgconf openssl
JOHN_SUBDIR = src

# The build expects to run these with same options as gcc
JOHN_CONF_ENV = CPP="$(TARGET_CC) -E" LD="$(TARGET_CC)" AS="$(TARGET_CC)"
JOHN_CONF_OPTS = \
	--enable-pkg-config \
	--disable-native-tests \
	$(if $(BR2_TOOLCHAIN_HAS_OPENMP),--enable,--disable)-openmp \
	--with-systemwide

# 0001-configure-use-pkg-config-openssl.patch
# 0002-configure-fix-unsafe-library-paths.patch
JOHN_AUTORECONF = YES

define JOHN_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/run/john $(TARGET_DIR)/usr/bin
	$(foreach f,unshadow unafs undrop zip2john gpg2john rar2john base64conv unique,
		ln -sf john $(TARGET_DIR)/usr/bin/$(f))
	mkdir -p $(TARGET_DIR)/usr/share/john/rules
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/john $(@D)/run/*.chr $(@D)/run/*.conf $(@D)/run/*.lst
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/john/rules $(@D)/run/rules/*
endef

$(eval $(autotools-package))
