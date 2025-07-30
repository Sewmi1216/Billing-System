<script setup>
import { ref } from "vue";
import NavBar from "@/components/NavBar.vue";
import bg from "@/assets/images/bg.jpg";

const amount = ref("");
const biller = ref("");

const errorMessages = ref(null);
const successMessage = ref(null);


const handleSubmit = async (e) => {
  e.preventDefault();

  errorMessages.value = null;
  successMessage.value = null;

  const formData = new FormData();
  formData.append("amount", amount.value);
  formData.append("biller", biller.value);

  try {
    const token = localStorage.getItem("token");
    console.log("Token from localStorage:", token);

    const response = await fetch(
      "http://127.0.0.1:8000/api/pay-bill",
      {
        method: "POST",
        headers: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
        body: formData,
      }
    );

    const data = await response.json();

    if (!response.ok) {
      errorMessages.value = data.errors || { form: ["Unknown error"] };
    } else {
      successMessage.value =
        data.message || "Payment successful";
      amount.value = "";
    }
  } catch (error) {
    errorMessages.value = { form: ["Network error or server unavailable."] };
  }
};
</script>

<template>
  <NavBar />

 <div
    class="min-h-screen bg-cover bg-center flex items-center justify-center px-4 py-8"
    :style="`background-image: url(${bg})`"
  >
    <section
      class="bg-white rounded-xl shadow-2xl w-full max-w-2xl p-6 md:p-10"
    >
      <form
        class="space-y-6"
        @submit="handleSubmit"
        enctype="multipart/form-data"
        novalidate
      >
        <h2 class="text-2xl font-semibold text-center text-gray-800">
          Bill Payment
        </h2>

        <div v-if="errorMessages" class="mb-4 text-red-600">
          <ul>
            <li v-for="(msgs, key) in errorMessages" :key="key">
              <span v-if="Array.isArray(msgs)">
                <span v-for="msg in msgs" :key="msg">{{ msg }}</span>
              </span>
              <span v-else>{{ msgs }}</span>
            </li>
          </ul>
        </div>
         <!-- Biller -->
        <div>
          <label
            for="timeSlot"
            class="block text-sm font-medium text-gray-700 mb-1"
          >
           Biller
          </label>
          <select
            id="biller"
            class="w-full border text-sm border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
            v-model="biller"
          >
            <option value="" disabled>Select a biller</option>
            <option>Electricity</option>
            <option>Water</option>
            <option>Internet</option>
          </select>
        </div>
        <!--  Amount -->
        <div>
          <label
            for="amount"
            class="block text-sm font-medium text-gray-700 mb-1"
          >
            Amount
          </label>
          <input
            type="number"
            id="amount"
            class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
            v-model="amount"
          />
        </div>

        <div
          v-if="successMessage"
          class="mb-4 text-green-600 font-semibold text-center"
        >
          {{ successMessage }}
        </div>
        <!-- Submit -->
        <div class="text-center">
          <button
            type="submit"
            class="w-1/4 bg-blue text-white py-2 rounded-md hover:bg-darkBlue transition duration-200"
          >
            Submit
          </button>
        </div>
      </form>
    </section>
  </div>
</template>
