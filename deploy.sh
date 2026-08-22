#!/bin/bash
# ================================
# Variables
# ================================

APP_DIR="/root/Stack8Tools"
BRANCH="main" # change if needed

# ================================
# Step 1: Go to project directory
# ================================
cd $APP_DIR || { echo "Directory $APP_DIR not found!"; exit 1; }

# ================================
# Step 2: Pull latest code
# ================================
git fetch origin $BRANCH
git reset --hard origin/$BRANCH

# ================================
# Step 3: Clean old build to prevent storage bloat
# ================================
echo "Cleaning old build..."
rm -rf .next

# ================================
# Step 4: Install dependencies (if needed)
# ================================
echo "Installing dependencies..."
npm install --frozen-lockfile

# ================================
# Step 5: Build Next.js project
# ================================
echo "Building project..."
npm run build

# ================================
# Step 6: Restart services
# ================================
# Restart your Node app if you use systemd or pm2
# Example with systemd service for your app:
# systemctl restart myproject.service

# Reload Nginx
systemctl reload nginx

echo "✅ Deploy finished!"
