<script setup>
import { ref, reactive } from "vue";
import axios from "axios";
import { useRouter } from "vue-router";
import loginBg from "@/assets/images/login4.jpg";

const router = useRouter();
const loginError = ref("");
const form = reactive({
  email: "",
  password: "",
});

const loginUser = async () => {
  try {
    const response = await axios.post("http://127.0.0.1:8000/api/login", form);

    const token = response.data.token;
    console.log(response.data.token);
    localStorage.setItem("token", token);
    router.push("/topup");

  } catch (error) {
    console.error("Login error:", error.response?.data || error.message);
    loginError.value = "Invalid email or password";
  }
};
</script>

<template>
  <div
    class="min-h-screen bg-cover bg-center flex items-center justify-center px-4 py-8"
    :style="`background-image: url(${loginBg})`"
  >
    <section
      class="flex flex-col md:flex-row backdrop-blur-md bg-white/10 rounded-xl shadow-2xl w-full max-w-2xl overflow-hidden"
    >
      <div
        class="md:w-1/2 w-auto p-8 text-black flex flex-col justify-center bg-white/10 backdrop-blur-sm"
      >
        <h1 class="text-3xl md:text-4xl font-bold font-mono mb-4">
          Welcome to BillBee
        </h1>
        <p class="text-sm md:text-base leading-relaxed">
          Log in to effortlessly manage your bills, make secure payments, and stay in control of your finances—all from the comfort of your home.
        </p>
      </div>

      <!-- Login Form -->
      <div class="md:w-1/2 w-full bg-white/40 backdrop-blur-lg p-8 md:p-12">
        <form class="space-y-6" @submit.prevent="loginUser">
          <div>
            <label
              for="email"
              class="block text-sm font-medium text-gray-700 mb-1"
            >
              Email
            </label>
            <input
              v-model="form.email"
              type="text"
              name="email"
              id="email"
              pattern="^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$"
              class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              required
            />
          </div>

          <div>
            <label
              for="password"
              class="block text-sm font-medium text-gray-700 mb-1"
            >
              Password
            </label>
            <input
              v-model="form.password"
              type="password"
              name="password"
              id="password"
              pattern=".{6,}"
              class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              placeholder="••••••••"
              required
            />
          </div>

         
          <p v-if="loginError" class="text-sm text-red-600 text-center">
            {{ loginError }}
          </p>

          <div class="text-center">
            <button
              type="submit"
              class="w-full bg-blue text-white py-2 rounded-md hover:bg-blue transition duration-200"
            >
              Login
            </button>
          </div>
          <div class="text-center text-xs">
            Don't have an account?
            <router-link to="/signup" class="text-blue hover:underline">
              Create new account
            </router-link>
          </div>
        </form>
      </div>
    </section>
  </div>
</template>
