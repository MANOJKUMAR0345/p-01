#!/bin/bash

# Student Attendance Tracker - Deployment Script
# Usage: sudo ./deploy.sh

echo "🚀 Starting Deployment Setup..."

# 1. Update System
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Install Dependencies
echo "🛠️ Installing Node.js, NPM, Git, Nginx, PM2..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs git nginx
sudo npm install -g pm2

# 3. Setup Project Directory
APP_DIR="/var/www/student-attendance-tracker"
REPO_URL="YOUR_GITHUB_REPO_URL_HERE" # User needs to replace this

if [ -d "$APP_DIR" ]; then
    echo "📂 Project directory exists. Pulling latest changes..."
    cd $APP_DIR
    # git pull origin main
else
    echo "📂 Cloning repository..."
    # git clone $REPO_URL $APP_DIR
    # For now, assuming files are copied manually or git is configured manually
    # mkdir -p $APP_DIR
fi

# 4. Backend Setup
echo "🔧 Setting up Backend..."
cd $APP_DIR/backend
if [ ! -f .env ]; then
    echo "⚠️ .env file missing in backend! Creating a sample one..."
    echo "PORT=5000" > .env
    echo "MONGO_URI=your_mongodb_connection_string" >> .env
    echo "JWT_SECRET=your_jwt_secret" >> .env
    echo "Please edit backend/.env with actual values."
fi
npm install
pm2 start server.js --name "attendance-backend"

# 5. Frontend Setup
echo "🎨 Setting up Frontend..."
cd $APP_DIR/frontend
npm install
npm run build

# 6. Nginx Configuration
echo "🌐 Configuring Nginx..."
sudo cp $APP_DIR/nginx.conf /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl restart nginx

echo "✅ Deployment Setup Complete!"
echo "👉 Check status with: pm2 status"
echo "👉 Backend running on port 5000"
echo "👉 Frontend served via Nginx on port 80"
