# ✧ Delight Studio – Cinematic Photography Landing Page ✧

A premium, high-end wedding photography landing page built with **Flutter Web**. **Delight Studio** (formerly Wedshoot) is designed to evoke a "Noir Grey" luxury aesthetic, featuring sophisticated glassmorphic UI elements, smooth section navigation, and fluid animations.

---

## 🔗 Live Demo
Check out the live cinematic experience:  
👉 **[delight-studio.heyhay.studio](https://heyhay-studio.github.io/delight_studio/)**

---

## ✨ Key Features

### 🧊 Advanced Glassmorphism UI
Every primary interactive element—from the **Top Navigation Bar** to the **Feature Cards** and **CTA Buttons** (Get in Touch, Book Now, Get a Quote)—is built with a sophisticated glassmorphic design using:
- `BackdropFilter` with `ImageFilter.blur` for a frosted-glass look.
- Semi-transparent white borders and multi-layered gradients.
- Subtle background "watermark" icons on feature cards for a layered visual depth.

### 🎭 Premium Fluid Animations
- **Logo Shimmer**: The "DELIGHT STUDIO" brand logo features a subtle, elegant silver shimmer that repeats every 3 seconds.
- **Icon Swing**: Social media icons in the hero sidebar gently rotate $\pm 18$ degrees, creating an organic "pendulum" effect.
- **Section Transistions**: All hero text and features use `flutter_animate` to fade and slide gracefully into view upon load.

### 📱 Fully Responsive Navigation
- **Smooth Section Scrolling**: Implemented using `GlobalKey` references for each major section, allowing for pixel-perfect, programmatic scrolling from the menu.
- **Layered Stack Architecture**: The navigation bar floats elegantly over the content on a top `Stack` layer.
- **Galaxy Z Fold Optimized**: Adaptive typography and dynamic padding ensure the layout remains overflow-free even on extremely narrow folded screens (300px - 350px).

### 🛠️ Sophisticated Components
- **Responsive Contact Form**: A glassmorphic form that supports 2-column or 1-column layouts with integrated event-specific fields.
- **Multi-Column Footer**: A comprehensive footer hub covering branding, categorized internal navigation (Pages & Help), and a functional Newsletter field.

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Stable Channel)
- Chrome Browser (for Web builds)

### Installation
1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/your-username/delight_studio.git
    cd delight_studio
    ```

2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run Locally (Web)**:
    ```bash
    flutter run -d chrome
    ```

---

## 🚀 Deployment

### Option 1: Vercel (Automatic Deployment)
To deploy this project to Vercel with automatic builds:
1.  **Connect your GitHub Repository** to the [Vercel Dashboard](https://vercel.com).
2.  In the **Build & Development Settings**, configure:
    - **Framework Preset**: `Other`
    - **Build Command**: `bash install-flutter.sh`
    - **Output Directory**: `build/web`
    - **Install Command**: `flutter pub get` (or leave empty, the script handles it)
3.  Click **Deploy**. Vercel will install Flutter and build the site.

### Option 2: GitHub Pages (Automatic)
The project is already configured with a GitHub Actions workflow in `.github/workflows/deploy.yml`. Merging changes into the `master` branch will automatically deploy to GitHub Pages.

---

## 📂 Project Structure

- `lib/main.dart`: Root entry point and main section coordinator.
- `lib/sections/`: Contains individual feature sections (Hero, About, Gallery, Packages, Contact, Footer).
- `lib/widgets/`: Reusable navigation components and UI overlays (TopNavigation, MobileMenu).
- `lib/theme/`: Centralized "Noir Grey" design system using `google_fonts`.

---

## 📦 Dependencies
- `google_fonts`: Premium typography (Playfair Display & Montserrat).
- `flutter_animate`: High-performance widget animations.
- `font_awesome_flutter`: Sophisticated social media iconography.
- `dart:ui`: Native low-level blurring for glassmorphism.

---

## 🎨 Design System
- **Background**: Noir Black (`0xFF121212`)
- **Primary Accent**: Cinematic Silver (`0xFFC0C0C0`)
- **Typography**:
  - `Playfair Display`: Used for High-end, Serif Headers.
  - `Montserrat`: Used for Modern, Geometric Body Copy and Labels.
