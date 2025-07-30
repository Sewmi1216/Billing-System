# 💸 BillBee - Billing System

Welcome to **BillBee**, your go-to digital platform for effortless bill management and secure payments. With a user-friendly interface and seamless experience, BillBee helps you stay in control of your finances — all from the comfort of your home.

---

## 🚀 Features

- 🔐 User Authentication (Login & Registration)
- 💰 Account Top-up
- 🧾 Pay Bills
- 🔄 Fund Transfer
- 📊 Transaction History
- 📋 Activity Log

---

## 📦 Tech Stack

**Backend**
- Laravel
- PHP
- MySQL

**Frontend**
- Vue.js
- Tailwind CSS
- Axios for API integration


---
## ⚙️ Project Setup

### Backend (Laravel)

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Sewmi1216/Billing-System.git
   ```


3. **Install PHP dependencies:**

   ```bash
   cd backend
   composer install
   ```

4. **Create `.env` file and configure:**

   ```bash
   cp .env.example .env
   ```

   Edit .env file and update the database credentials.

5. **Run migrations:**

   ```bash
    php artisan migrate
   ```
   
6. **Serve the Laravel app:**

   ```bash
   php artisan serve
   ```

   Laravel backend runs at `http://127.0.0.1:8000`

---

### Frontend (Vue.js)

1. **Navigate to the frontend directory:**

   ```bash
   cd frontend
   ```

2. **Install Node dependencies:**

   ```bash
   npm install
   ```

3. **Run the frontend:**

   ```bash
   npm run dev
   ```
  Vue app runs at `http://localhost:5173` or the port displayed in the terminal.

---
