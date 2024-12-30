DEVICE_VARS += TPLINK_FLASHLAYOUT TPLINK_HWID TPLINK_HWREV TPLINK_HWREVADD TPLINK_HVERSION

define Device/dsa-migration
  DEVICE_COMPAT_VERSION := 1.1
  DEVICE_COMPAT_MESSAGE := Config cannot be migrated from swconfig to DSA
endef

define Device/lantiqTpLink
  DEVICE_VENDOR := TP-Link
  TPLINK_HWREVADD := 0
  TPLINK_HVERSION := 2
  KERNEL := kernel-bin | append-dtb | lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | \
	tplink-v2-header -s -V "ver. 1.0"
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin := tplink-v2-image -s -V "ver. 1.0" | \
	check-size | append-metadata
endef

define Device/tplink_vr200
  $(Device/dsa-migration)
  $(Device/lantiqTpLink)
  DEVICE_MODEL := Archer VR200
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 16Mltq
  TPLINK_HWID := 0x63e64801
  TPLINK_HWREV := 0x53
  IMAGE_SIZE := 15808k
  DEVICE_PACKAGES:= kmod-mt76x0e wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += VR200
endef
TARGET_DEVICES += tplink_vr200

define Device/tplink_vr200v
  $(Device/dsa-migration)
  $(Device/lantiqTpLink)
  DEVICE_MODEL := Archer VR200v
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 16Mltq
  TPLINK_HWID := 0x73b70801
  TPLINK_HWREV := 0x2f
  IMAGE_SIZE := 15808k
  DEVICE_PACKAGES:= kmod-mt76x0e wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport kmod-ltq-tapi kmod-ltq-vmmc
  SUPPORTED_DEVICES += VR200v
endef
TARGET_DEVICES += tplink_vr200v
define Device/TDW8970-16M
  $(Device/dsa-migration)
  $(Device/lantiqTpLink)
  DEVICE_PROFILE := TDW8970-16M
  BOARD_ID := TD-W8970v1-16m
  IMAGE_SIZE := 15808k
  DEVICE_TITLE := TP-LINK TD-W8970 16M Flash
  DEVICE_PACKAGES:= kmod-ath9k kmod-owl-loader wpad-mini kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  DEVICE_MODEL := TD-W8970v1-16m
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 16Mltq-8Mflsh
  TPLINK_HWID := 0x89700001
  TPLINK_HWREV := 1

endef
TARGET_DEVICES +=TDW8970-16M 
define Device/TDW8980-16M
  $(Device/dsa-migration)
  $(Device/lantiqTpLink)
  DEVICE_PROFILE := TDW8980-16M
  BOARD_ID := TD-W8980v1-16m
  IMAGE_SIZE := 15808k
  DEVICE_TITLE := TP-LINK TD-W8980 16M Flash
  DEVICE_PACKAGES:= kmod-ath9k kmod-owl-loader wpad-mini kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  DEVICE_MODEL := TD-W8980v1-16m
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 16Mltq-8Mflsh
  TPLINK_HWID := 0x89800001
  TPLINK_HWREV := 14

endef
TARGET_DEVICES +=TDW8980-16M 
