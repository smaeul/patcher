#!/bin/sh

# Apply these patches before compilation:
COPPERHEAD=$PWD/patcher/copperhead
CUSTOM=$PWD/patcher/custom
SMAEUL=$PWD/patcher/smaeul
SULTAN=$PWD/patcher/sultan

# Clean up first
git -C build				clean -dfqx
git -C build				reset -q --hard
git -C device/oneplus/oneplus3		clean -dfqx
git -C device/oneplus/oneplus3		reset -q --hard
git -C device/oppo/common		clean -dfqx
git -C device/oppo/common		reset -q --hard
git -C frameworks/av			clean -dfqx
git -C frameworks/av			reset -q --hard
git -C frameworks/base			clean -dfqx
git -C frameworks/base			reset -q --hard
git -C frameworks/native		clean -dfqx
git -C frameworks/native		reset -q --hard
git -C packages/apps/Gallery2		clean -dfqx
git -C packages/apps/Gallery2		reset -q --hard
git -C packages/apps/LockClock		clean -dfqx
git -C packages/apps/LockClock		reset -q --hard
git -C packages/apps/Settings		clean -dfqx
git -C packages/apps/Settings		reset -q --hard
git -C system/core			clean -dfqx
git -C system/core			reset -q --hard
git -C vendor/cm			clean -dfqx
git -C vendor/cm			reset -q --hard

### Sultan's patches
git -C build				apply $SULTAN/build0.patch
git -C device/oppo/common		apply $SULTAN/device-oppo-common0.patch
git -C frameworks/av			apply $SULTAN/frameworks-av0.patch
git -C frameworks/base			apply $SULTAN/frameworks-base0.patch
git -C frameworks/base			apply $SULTAN/frameworks-base1.patch
git -C frameworks/base			apply $SULTAN/frameworks-base2.patch
git -C frameworks/base			apply $SULTAN/frameworks-base3.patch
git -C frameworks/base			apply $SULTAN/frameworks-base4.patch
git -C frameworks/native		apply $SULTAN/frameworks-native0.patch
git -C packages/apps/LockClock		apply $SULTAN/packages-apps-LockClock0.patch
git -C packages/apps/Settings		apply $SULTAN/packages-apps-Settings0.patch
git -C system/core			apply $SULTAN/system-core0.patch
git -C system/core			apply $SULTAN/system-core1.patch
git -C vendor/cm			apply $SULTAN/vendor-cm0.patch
git -C vendor/cm			apply $SULTAN/vendor-cm1.patch

### Custom patches
git -C frameworks/av			apply $CUSTOM/frameworks-av0.patch
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery20.patch
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery21.patch
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery22.patch

### Patches from copperhead
git -C frameworks/base			apply $COPPERHEAD/d60fe08d9fcedb495d3a691cd5875e4f1d97c9cb.patch
git -C frameworks/base			apply $COPPERHEAD/358c080ad19248a7b638136a78fe720f889b09fb.patch
git -C frameworks/base			apply $COPPERHEAD/d7f30ccd64d493311272787abcb320dcfe6ff94a.patch
git -C frameworks/base			apply $COPPERHEAD/f9de29da754b6fb5b4852f1c594b3f1f3de125a3.patch
git -C frameworks/base			apply $COPPERHEAD/fa5b72d2290609677f38a4bc991275ff1271ac3c.patch

### smaeul's patches
git -C device/oneplus/oneplus3		apply $SMAEUL/device_oneplus3-boot_signer.patch
git -C frameworks/base			apply $SMAEUL/frameworks_base-google_voice_microg.patch
git -C frameworks/base			apply $SMAEUL/frameworks_base-signature_spoofing.patch
git -C vendor/cm			apply $SMAEUL/vendor_cm-packages.patch
