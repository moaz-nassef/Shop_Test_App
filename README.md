<div align="center">

# 🛍️ Shop Test App

**A premium e‑commerce shopping experience — browse, search, cart & manage products.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter&logoColor=white&color=02569B)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white&color=02569B)](https://dart.dev)
[![State Mgmt](https://img.shields.io/badge/State-Riverpod-7B61F1?style=for-the-badge&logo=flutter&logoColor=white)]
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

</div>

---

## ✨ About the Project

**Shop Test App** is a modern **e‑commerce application** built with **Flutter + Riverpod** that delivers a polished shopping experience:

- 🏬 **Product catalog** with a smooth grid & search
- 🧺 **Shopping cart** with real‑time badge updates
- 🧭 **Four-tab shell** — Home, Search, Cart and Profile with animated navigation
- 🖼️ **Product details** with a gorgeous **glass‑morphism** design
- ✏️ **Add / update products** from within the app
- 🔖 **Category filters** + color options & skeletons

Wrapped in a **clean‑architecture, feature‑first** structure with a premium gradient design language, smooth page transitions, and an animated bottom navigation bar.

---

## 🚀 Features

| Feature | Description |
|---|---|
| 🏬 **Catalog** | Grid of featured products with ratings & pricing |
| 🔎 **Search** | Instant product search across the store |
| 🧺 **Cart** | Add / remove items with live badge count updates |
| 🧭 **Navigation Shell** | Animated PageView navigation for Home, Search, Cart and Profile |
| 🖼️ **Product Details** | Full details with gallery, colors & action bar |
| ✏️ **Add / Update** | Create new products and edit existing ones in‑app |
| 🔖 **Category Filters** | Filter chips + all‑categories browsing |
| 🔄 **Pull to Refresh** | Reload the catalog with native refresh feedback |
| 🧩 **Friendly States** | Dedicated loading skeletons, empty states and error UI |
| 🎨 **Glass‑morphism UI** | Premium frosted‑glass cards & surfaces |
| 🌗 **Light & Dark Themes** | System‑aware theming |
| 💀 **Skeleton Loaders** | Beautiful loading placeholders |
| 🚀 **Splash & Transitions** | Branded splash + animated page transitions |

---

## 🧱 Tech Stack

<div align="center">

| 🛠️ Tool | Purpose |
|---|---|
| [Flutter](https://flutter.dev) | Cross‑platform UI framework |
| [Riverpod](https://riverpod.dev) | Type‑safe reactive state management |
| [http](https://pub.dev/packages/http) | REST API client |
| [google_fonts](https://pub.dev/packages/google_fonts) | Google Fonts typography |
| [modal_progress_hud_nsn](https://pub.dev/packages/modal_progress_hud_nsn) | Loading overlays |

</div>

---

## 📂 Project Structure

```
lib/
├── main.dart                    # App entry & navigation shell
├── core/
│   ├── constants/               # Colors, dimensions, text styles
│   ├── theme/                   # Light & dark themes
│   └── utils/                   # Page transitions
├── features/
│   ├── cart/                    # Cart state (Riverpod)
│   └── products/                # Product state/provider
├── models/                      # Product model
├── screens/                     # Home, Search, Cart, Profile, Detail, Splash
├── servis/                      # API services (get/add/update products & categories)
└── widgets/                     # Cards, filters, inputs, nav, skeletons, empty/error states
```

---

## ✅ Getting Started

### Prerequisites
- 🦋 **Flutter SDK** `>= 3.7`
- A REST API for products (see `servis/` and `.env.example`)

### Installation

```bash
# 1️⃣ Clone the repository
git clone https://github.com/moaz-nassef/Shop_Test_App.git
cd Shop_Test_App

# 2️⃣ Install dependencies
flutter pub get

# 3️⃣ Configure your API
#  - use `.env.example` as the reference for your product API settings
#  - point the service files to your product endpoint

# 4️⃣ Run the app
flutter run
```

---

## 🧭 Roadmap

- [x] Product catalog + search
- [x] Cart with live badge
- [x] Product add/update
- [x] Category filters & glass UI
- [x] Dedicated search, cart, profile and product-detail screens
- [x] Four-tab animated navigation shell + pull-to-refresh
- [x] Loading, empty and error feedback states
- [ ] 🛒 Checkout flow
- [ ] ❤️ Favorites & wishlist
- [ ] 🧾 Order history

---

## 🤝 Contributing

Contributions are always welcome! 🎉

1. 🍴 Fork the repository
2. 🌿 Create your feature branch (`git checkout -b feature/amazing-feature`)
3. 💾 Commit your changes (`git commit -m 'Add some amazing feature'`)
4. 📤 Push to the branch (`git push origin feature/amazing-feature`)
5. 🔀 Open a Pull Request

---

## 📞 Contact

**Moaz Nassef** — [GitHub](https://github.com/moaz-nassef)

---

<div align="center">

Made with 💜 using Flutter & Riverpod

⭐ **Don't forget to star this repo if you like it!** ⭐

</div>
