import { createRouter, createWebHistory } from 'vue-router';
import LoginView from '@/views/Login.vue';
import SignupView from '@/views/Signup.vue';
import TopUpView from '@/views/TopUp.vue';
import PayBillView from '@/views/PayBill.vue';
import TransferView from '@/views/Transfer.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
    path: '/',
    redirect: '/login',
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView,
    },
    {
        path:'/signup',
        name:'signup',
        component:SignupView
    },
     {
        path:'/topup',
        name:'topup',
        component:TopUpView
    },
     {
        path:'/pay',
        name:'pay',
        component:PayBillView
    },
     {
        path:'/transfer',
        name:'transfer',
        component:TransferView
    },
  ],
});

export default router;
