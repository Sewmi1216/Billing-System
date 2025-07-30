<script setup>
import { reactive, ref } from "vue";
import axios from "axios";
import { useRouter } from "vue-router";
import loginBg from "@/assets/images/login3.jpg";

const router = useRouter();
const errors = ref([]);

const form = reactive({
  name: "",
  email: "",
  password: "",
  password_confirmation: "",
});


const registerUser = async (e) => {
  e.preventDefault();

  try {
    const response = await axios.post(
      "http://127.0.0.1:8000/api/register",
      form
    );
    console.log("Registration successful:", response.data);
    router.push("/login");
  } catch (error) {
    console.error("Registration error:", error.response?.data || error.message);
    errors.value.push("Registration failed. Please try again.");
  }
};
</script>

<template>
  <div
    class="min-h-screen bg-cover bg-center flex items-center justify-center px-4 py-8"
    :style="`background-image: url(${loginBg})`"
  >
    <section
      class="backdrop-blur-md bg-white/40 rounded-xl shadow-2xl w-full max-w-2xl p-9 md:p-10"
    >
      <form class="space-y-5" @submit="registerUser">
        <h2
          class="text-xl md:text-2xl font-semibold text-center mb-4 text-gray-800"
        >
          Create an Account
        </h2>

        <!-- Name -->
        <div>
          <label for="name" class="block text-sm font-medium text-gray-700 mb-1"
            >Name</label
          >
          <input
            v-model="form.name"
            type="text"
            id="name"
            class="w-full border rounded-md px-3 py-2"
            required
          />
        </div>

        <!-- Email -->
        <div>
          <label
            for="email"
            class="block text-sm font-medium text-gray-700 mb-1"
            >Email</label
          >
          <input
            v-model="form.email"
            type="email"
            id="email"
            pattern="^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$"
            class="w-full border rounded-md px-3 py-2"
            required
          />
        </div>

  

        <!-- Password -->
        <div>
          <label
            for="password"
            class="block text-sm font-medium text-gray-700 mb-1"
            >Password</label
          >
          <input
            v-model="form.password"
            type="password"
            pattern=".{6,}"
            id="password"
            class="w-full border rounded-md px-3 py-2"
            required
          />
        </div>
         <!-- Re-enter Password -->
        <div>
          <label
            for="password"
            class="block text-sm font-medium text-gray-700 mb-1"
            >Re-enter Password</label
          >
          <input
            v-model="form.password_confirmation"
            type="password"
            pattern=".{6,}"
            id="password_confirmation"
            class="w-full border rounded-md px-3 py-2"
            required
          />
        </div>

        <!-- Submit Button -->
        <div class="text-center">
          <button
            type="submit"
            class="w-1/4 bg-blue text-white py-2 rounded-md hover:bg-darkBlue transition duration-200"
          >
            Signup
          </button>
        </div>

        <!-- Login Link -->
        <div class="text-center text-sm">
          Already have an account?
          <router-link
            to="/login"
            class="text-darkBlue font-semibold hover:underline ml-1"
            >Login</router-link
          >
        </div>
      </form>
    </section>
  </div>
</template>
