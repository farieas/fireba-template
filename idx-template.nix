{ pkgs, ... }: {
  packages = [
    pkgs.rsync  # For better file copying
  ];
  bootstrap = ''
    set -e  # Exit on error
    
    echo "🔧 Initializing Flutter Firebase Template..."
    
    # Create workspace directory
    # mkdir -p "$WS_NAME"
    # mkdir -p "$out"
    echo " path :: $out"
    # Copy Flutter project using rsync (preserves permissions and handles hidden files)
    if [ -d "$HOME/myapp" ]; then

        flutter create "$out"
    else
      echo "❌ Error: Flutter project not found at $HOME/myapp"
      exit 1
    fi
    
    # Create .idx configuration directory
    # mkdir -p "$out/.idx"
    
    # Copy development environment configuration
    cp ${./dev.nix} "$out/.idx/dev.nix"
    
    # Ensure all files are writable
    chmod -R u+w "$out"
    
    # Move workspace to output location
    # mv "$WS_NAME" "$out"
    
    echo ""
    echo "═══════════════════════════════════════"
    echo "✨ Flutter Firebase Template Ready! ✨"
    echo "═══════════════════════════════════════"
    echo "📁 Project location: $out"
    echo "🎯 Main file: lib/main.dart"
    echo "▶️  Run: flutter run"
    echo "═══════════════════════════════════════"
  '';
}
