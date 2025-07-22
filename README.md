Steps to Run

1. **Install dependencies:**

   flutter pub get

3. **Update the API IP Address:**

   - The app communicates with a backend server using an IP address hardcoded in the BLoC files (inside `lib/create company/`, `lib/create service/`, etc.).
   - Each emulator/device may require a different IP address to access your local backend.
   - To find your local IP address:
     1. Open Command Prompt.
     2. Run: ipconfig
     3. Look for the `IPv4 Address` under your active network adapter (e.g., `192.168.x.x`).
   - Open the relevant BLoC Dart files and replace the existing IP address with your current local IP.

4. **Run the app:**

   flutter run
