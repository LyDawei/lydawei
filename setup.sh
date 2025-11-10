#!/bin/bash

# Conductor Setup Script for Astro Blog
# This script sets up the development environment for the project

set -e  # Exit on error

echo "=========================================="
echo "  Conductor Setup - Astro Blog Project"
echo "=========================================="
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored messages
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Check if Node.js is installed
check_node() {
    print_info "Checking Node.js installation..."
    if command -v node &> /dev/null; then
        NODE_VERSION=$(node -v)
        print_success "Node.js is installed: $NODE_VERSION"

        # Check if Node version is >= 18
        NODE_MAJOR_VERSION=$(echo $NODE_VERSION | cut -d'.' -f1 | sed 's/v//')
        if [ "$NODE_MAJOR_VERSION" -lt 18 ]; then
            print_warning "Node.js version 18 or higher is recommended for Astro"
            print_info "Current version: $NODE_VERSION"
        fi
    else
        print_error "Node.js is not installed!"
        print_info "Please install Node.js from https://nodejs.org/"
        exit 1
    fi
    echo ""
}

# Check if npm is installed
check_npm() {
    print_info "Checking npm installation..."
    if command -v npm &> /dev/null; then
        NPM_VERSION=$(npm -v)
        print_success "npm is installed: v$NPM_VERSION"
    else
        print_error "npm is not installed!"
        exit 1
    fi
    echo ""
}

# Clean previous installations
clean_install() {
    print_info "Checking for previous installations..."
    if [ -d "node_modules" ]; then
        print_success "Found existing node_modules directory"
        print_info "Skipping clean install (dependencies already exist)"
    fi

    if [ -f "package-lock.json" ]; then
        print_success "Found existing package-lock.json"
    fi
    echo ""
}

# Install dependencies
install_dependencies() {
    print_info "Installing project dependencies..."
    echo ""

    if npm install; then
        print_success "Dependencies installed successfully!"
    else
        print_error "Failed to install dependencies"
        exit 1
    fi
    echo ""
}

# Verify installation
verify_installation() {
    print_info "Verifying installation..."

    # Check if Astro is installed
    if [ -d "node_modules/astro" ]; then
        ASTRO_VERSION=$(npm list astro --depth=0 2>/dev/null | grep astro | sed 's/.*@//')
        print_success "Astro is installed: $ASTRO_VERSION"
    else
        print_error "Astro installation verification failed"
        exit 1
    fi

    # Check if critical directories exist
    if [ -d "src" ]; then
        print_success "Source directory found"
    else
        print_warning "Source directory not found"
    fi

    if [ -d "public" ]; then
        print_success "Public directory found"
    else
        print_warning "Public directory not found"
    fi

    echo ""
}

# Create or verify .env file (if needed)
setup_env() {
    print_info "Checking environment configuration..."

    if [ -f ".env.example" ]; then
        if [ ! -f ".env" ]; then
            print_warning ".env file not found"
            cp .env.example .env
            print_success "Created .env file from .env.example"
            print_warning "Please update .env with your configuration"
        else
            print_success ".env file exists"
        fi
    else
        print_info "No .env.example found (not required for this project)"
    fi
    echo ""
}

# Display next steps
show_next_steps() {
    echo ""
    echo "=========================================="
    echo "  Setup Complete!"
    echo "=========================================="
    echo ""
    print_success "Your development environment is ready!"
    echo ""
    echo "Next steps:"
    echo ""
    echo "  1. Start the development server:"
    echo "     ${BLUE}npm run dev${NC}"
    echo ""
    echo "  2. Open your browser to:"
    echo "     ${BLUE}http://localhost:3000${NC}"
    echo ""
    echo "  3. Build for production:"
    echo "     ${BLUE}npm run build${NC}"
    echo ""
    echo "  4. Preview production build:"
    echo "     ${BLUE}npm run preview${NC}"
    echo ""
    echo "=========================================="
    echo ""
}

# Main execution
main() {
    # Check prerequisites
    check_node
    check_npm

    # Setup process
    clean_install
    install_dependencies
    verify_installation
    setup_env

    # Show completion message
    show_next_steps
}

# Run main function
main
