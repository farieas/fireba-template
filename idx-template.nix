{ pkgs, ... }: {
  packages = [
    pkgs.rsync  # For better file copying
  ];
  bootstrap = ''
    set -e  # Exit on error
    
    echo "🔧 Initializing Flutter Firebase Template..."
    
    # Create workspace directory
    mkdir -p "$WS_NAME"
    
    # Copy Flutter project using rsync (preserves permissions and handles hidden files)
    if [ -d "$HOME/myapp" ]; then
     #  flutter create "$HOME/user/my_flutter/"
    else
      echo "❌ Error: Flutter project not found at $HOME/myapp"
      exit 1
    fi
    
    # Create .idx configuration directory
    mkdir -p "$WS_NAME/.idx"
    
    # Copy development environment configuration
    cp ${./dev.nix} "$WS_NAME/.idx/dev.nix"
    
    # Ensure all files are writable
    chmod -R u+w "$WS_NAME"
    
    # Move workspace to output location
    mv "$WS_NAME" "$out"
    
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
