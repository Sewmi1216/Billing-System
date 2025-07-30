<script setup>

import { useRouter } from "vue-router";
const router = useRouter();

const logout = async () => {
  try {
    const response = await fetch(`http://127.0.0.1:8000/api/logout`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });

    if (response.ok) {
      alert("Logged out successfully");
      router.push("/login");
    } else {
      const error = await response.json();
      alert("Logout failed: " + (error.message || "Unknown error"));
    }
  } catch (error) {
    alert("Logout error: " + error.message);
  }
};
</script>

<template>
  <!-- Navigation Bar -->
  <nav class="bg-white shadow-md px-6 py-4 flex items-center justify-between">
    <!-- Logo -->
    <div class="text-gray-600 text-2xl font-extrabold italic tracking-widest">
      BillBee
    </div>

    <ul
      class="hidden md:flex space-x-6 items-center text-sm font-medium text-gray-700"
    >
      <RouterLink to="/topup" v-slot="{ isActive }"
        ><li
          :class="[
            'px-4 py-2 transition-colors duration-200 cursor-pointer',
            isActive
              ? 'bg-blue hover:bg-darkBlue text-white rounded-full'
              : 'hover:border-darkBlue',
          ]"
        >
          Account Top-up
        </li></RouterLink
      >
      <RouterLink to="/pay" v-slot="{ isActive }">
        <li
          :class="[
            'px-4 py-2 transition-colors duration-200 cursor-pointer',
            isActive
              ? 'bg-blue hover:bg-darkBlue text-white rounded-full'
              : 'hover:border-darkBlue',
          ]"
        >
          Bill Payment
        </li></RouterLink
      >
      <RouterLink to="/transfer" v-slot="{ isActive }">
        <li
          :class="[
            'px-4 py-2 transition-colors duration-200 cursor-pointer',
            isActive
              ? 'bg-blue hover:bg-darkBlue text-white rounded-full'
              : 'hover:border-darkBlue',
          ]"
        >
          Fund Transfer
        </li></RouterLink
      >

      <div
        :class="[
          'pl-3 py-2 border-l-4 transition pr-3',
          isActive
            ? 'text-darkBlue font-semibold border-darkBlue bg-gray-100'
            : 'text-gray-700 border-transparent hover:text-darkBlue hover:border-darkBlue',
        ]"
      ></div>

      <li
        class="hover:text-darkBlue transition-colors duration-200 cursor-pointer"
        @click="logout"
      >
        Logout
      </li>
    </ul>
  </nav>

</template>
