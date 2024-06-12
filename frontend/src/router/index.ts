import { createRouter, createWebHistory } from 'vue-router';
// import HomeView from '../components/body/home/Home.vue';
// import LoginView from '../components/body/auth/login/Login.vue';
import RegisterView from '../views/registration/Registration.vue';
import LoginView from '../views/login/Login.vue';
import HomeView from '../views/home/Home.vue';
import ProgressView from '../views/progress/Progress.vue';
import UpdateView from '../views/update/Update.vue';
import TrainingNutrationView from '../views/training_nutrition/TrainingNutrition.vue';
import ProfileView from '../views/profile/Profile.vue';

const routes = [
  {
    path: '/register',
    name: 'RegisterView',
    component: RegisterView
  },
  {
    path: '/login',
    name: 'LoginView',
    component: LoginView
  },
  {
    path: '/home',
    name: 'HomeView',
    component: HomeView
  },
  {
    path: '/progress',
    name: 'ProgressView',
    component: ProgressView
  },
  {
    path: '/update',
    name: 'UpdateView',
    component: UpdateView
  },
  {
    path: '/training',
    name: 'TrainingView',
    component: TrainingNutrationView
  },
  {
    path: '/profile',
    name: 'ProfileView',
    component: ProfileView
  }
];

const router = createRouter({
  // history: createWebHistory(process.env.BASE_URL),
  // routes
  history: createWebHistory(),
  routes
});

export default router;
