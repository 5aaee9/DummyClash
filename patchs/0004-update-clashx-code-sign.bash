#!/usr/bin/bash
set -ex

sed -i '' 's/CODE_SIGN_IDENTITY = "-";/CODE_SIGN_IDENTITY = "Apple Development";/g' clashX/ClashX.xcodeproj/project.pbxproj
sed -i '' 's/CODE_SIGN_IDENTITY = "Developer ID Application";/CODE_SIGN_IDENTITY = "Apple Development";/g' clashX/ClashX.xcodeproj/project.pbxproj
sed -i '' 's/DEVELOPMENT_TEAM = MEWHFZ92DY;/DEVELOPMENT_TEAM = 7BG9T7B3R7;/g' clashX/ClashX.xcodeproj/project.pbxproj
