# Copyright (C) 2019 RevengeOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

REVENGEOS_CODENAME := Q
REVENGEOS_REVISION := 3
REVENGEOS_SUBREVISION := 0

REVENGEOS_FULL_REVISION := $(REVENGEOS_REVISION).$(REVENGEOS_SUBREVISION)
REVENGEOS_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

ifndef REVENGEOS_BUILDTYPE
  REVENGEOS_BUILDTYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst revengeos_,,$(TARGET_PRODUCT_SHORT))

REVENGEOS_VERSION := $(REVENGEOS_REVISION).$(REVENGEOS_SUBREVISION)-$(REVENGEOS_CODENAME)-$(REVENGEOS_BUILDTYPE)-$(TARGET_PRODUCT_SHORT)-$(REVENGEOS_BUILD_DATE)
REVENGEOS_BUILD_FINGERPRINT := RevengeOS/$(REVENGEOS_FULL_REVISION)/$(TARGET_PRODUCT_SHORT)/$(REVENGEOS_BUILD_DATE)

# Apply it to build.prop
REVENGEOS_PROPERTIES += \
    ro.revengeos.fingerprint=$(REVENGEOS_BUILD_FINGERPRINT) \
    ro.revengeos.revision=$(REVENGEOS_FULL_REVISION) \
    ro.revengeos.version=RevengeOS-$(REVENGEOS_VERSION) \
    ro.ota.revengeos.version=$(REVENGEOS_VERSION)
