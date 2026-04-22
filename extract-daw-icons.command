#!/bin/bash
# Extract DAW app icons from installed applications
cd "$(dirname "$0")"

echo "🎵 Extracting DAW icons..."

# Ableton Live
ABLETON=$(ls /Applications | grep -i "Ableton Live" | head -1)
if [ -n "$ABLETON" ]; then
    ICNS=$(find "/Applications/$ABLETON/Contents/Resources" -name "*.icns" | head -1)
    if [ -n "$ICNS" ]; then
        sips -s format png "$ICNS" --out "icon-ableton.png" --resampleWidth 128 > /dev/null 2>&1
        echo "✅ Ableton Live icon extracted"
    fi
else
    echo "⚠️  Ableton Live not found in /Applications"
fi

# Pro Tools
PROTOOLS=$(ls /Applications | grep -i "Pro Tools" | head -1)
if [ -n "$PROTOOLS" ]; then
    ICNS=$(find "/Applications/$PROTOOLS/Contents/Resources" -name "*.icns" | head -1)
    if [ -n "$ICNS" ]; then
        sips -s format png "$ICNS" --out "icon-protools.png" --resampleWidth 128 > /dev/null 2>&1
        echo "✅ Pro Tools icon extracted"
    fi
else
    echo "⚠️  Pro Tools not found in /Applications"
fi

# Logic Pro
if [ -d "/Applications/Logic Pro.app" ]; then
    ICNS=$(find "/Applications/Logic Pro.app/Contents/Resources" -name "*.icns" | head -1)
    if [ -n "$ICNS" ]; then
        sips -s format png "$ICNS" --out "icon-logic.png" --resampleWidth 128 > /dev/null 2>&1
        echo "✅ Logic Pro icon extracted"
    fi
else
    echo "⚠️  Logic Pro not found in /Applications"
fi

echo ""
echo "Done! Press any key to close..."
read -n 1
