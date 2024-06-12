<template>
    <header :class="{ hidden: isHidden }">
        <div class="header-info-box">
            <router-link class="link-box" to="/home">
                <div class="logo-box">
                    <img class="header-logo" src="../../../public/logo/logo.png" alt="logo">
                    <p>FitLife</p>
                </div>
            </router-link>
            <nav>
                <router-link class="link-box" to="/home"><p>Головна</p></router-link>
                <router-link class="link-box" to="/training"><p>Тренування</p></router-link>
                <router-link class="link-box" to="/progress"><p>Прогрес</p></router-link>
            </nav>
            <button class="btn-profile" :class="{'btn-profile-active':isModalOpen}" @click="openModal">
                <p v-if="token" class="register-logo">{{ username?.substr(0, 7) }}</p>
                <img v-else class="ntr-avatar" src="../../../public/user-avatar/not-register-avatar.svg" alt="not-register-avatar">
            </button>
        </div>
    </header>
    <div v-if="isModalOpen" class="modal-overlay" @click.self="closeModal">
        <div v-if="!token" class="modal-content">
            <h2>Вхід у систему</h2>
            <button class="model-btn-close" @click="closeModal">×</button>
            <router-link @click="closeModal" class="model-btn-link" to="/login"> <button class="model-btn">Авторизуватися</button> </router-link>
            <router-link @click="closeModal" class="model-btn-link" to="/register"> <button class="model-btn">Зареєструватися</button> </router-link>
        </div>        
        <div v-else class="modal-content">
            <h2>Вітаю, {{ username !=='' ? username: '' }}</h2>
            <button class="model-btn-close" @click="closeModal">×</button>
            <router-link @click="closeModal" class="model-btn-link" to="/profile"> <button class="model-btn">Профіль</button> </router-link>
            <div class="model-btn-link"> <button @click="logout" class="model-btn">Вийти</button> </div>
        </div>
    </div>
</template>
<script>
    import router from '../../router';
    import {mapGetters, mapActions} from "vuex";

    export default {
        name: 'Header',
        data() {
            return {
                lastScrollY: 0,
                isHidden: false,
                isModalOpen: false,
                scrollPosition: 0,
                token: false,
                username: ""
            };
        },
        methods: {
            ...mapActions(["clearDataTrainingType", "clearDataUser", "clearProgressData", "clearDataExercises", "clearDataNurrition", "clearDataNotes"]),
            handleScroll() {
                if (!this.isModalOpen) {
                    const currentScrollY = window.scrollY;
                    this.isHidden = currentScrollY > this.lastScrollY;
                    this.lastScrollY = currentScrollY;
                } else {
                    window.scrollTo(0, this.scrollPosition);
                }
            },
            openModal() {
                this.isModalOpen = true;
                this.scrollPosition = window.scrollY;
            },
            closeModal() {
                this.isModalOpen = false;
                // window.scrollTo(0, this.lastScrollY);
            },
            async logout() {
                sessionStorage.removeItem("token");
                sessionStorage.removeItem("username");
                await this.clearDataTrainingType();
                await this.clearDataUser();
                await this.clearProgressData();
                await this.clearDataNurrition();
                await this.clearDataExercises();
                await this.clearDataNotes();
                router.push("/login"); 
                this.closeModal();
            },
        },
        mounted() {
            window.addEventListener('scroll', this.handleScroll);

            if(sessionStorage.getItem("token")) {
                this.token = true;
                this.username = sessionStorage.getItem("username");
            }
            else {
                this.token = false;
                this.username = "";
            }
        },
        beforeDestroy() {
            window.removeEventListener('scroll', this.handleScroll);
        },
    };
</script>

<style scoped>
    header {
        position: sticky;
        top: 0;
        width: 100%;
        background-color: rgb(19 19 19 / 92%);
        z-index: 1000; /* Ensure the header is above other content */
        display: flex;
        justify-content: center;
        align-items: center;
        /* height: 52px; */
        height: 3.325rem;
        transition: all 0.5s cubic-bezier(.33,1,.68,1);
        /* position: relative; */
    }

    header.hidden {
        transform: translateY(-100%);
    }

    .header-info-box {
        width: 72%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .logo-box {
        height: 90%;
        width: 120px;
        display: flex;
        align-items: center;
        justify-content: space-evenly;
        cursor: pointer;
    }

    .logo-box p {
        font-size: 23px;
        color: #b8c3cc;
        font-family: 'Open Sans';
    }

    .logo-box .header-logo {
        background: aliceblue;
        border-radius: 5px;
        padding: 5px;
        width: 26px;
        height: 26px;
    }



    nav {
        display: flex;
        align-items: center;
        width: 50%;
        /* font-weight: bold; */
        font-size: 15px;
        color: #b8c3cc;
        font-family: 'Open Sans';
        height: 100%;
        justify-content: space-evenly;
    }

    nav p {
        cursor: pointer;
        transition: all 0.46s ease-out;
        position: relative;
    }

    nav p::after {
        content: ""; /* Додаємо пустий контент */
        position: absolute; /* Абсолютне позиціонування відносно .next */
        bottom: -4.2px; /* Розміщуємо лінію внизу */
        left: 50%; /* Починаємо лінію з середини .next */
        transform: translateX(-50%); /* Зсуваємо лінію на половину своєї ширини вліво */
        width: 30%; /* Ширина лінії - 33% */
        height: 1.3px; /* Висота лінії */
        background-color: aliceblue; /* Колір лінії */
        transition: all 0.35s ease;
    }

    nav p:hover {
        color: aliceblue;
    }

    nav p:hover::after {
        width: 85%;
    }

    .btn-profile {
        border: none;
        background: none;
        border-radius: 5px;
        width: 120px;
        height: 35px;
        background-color: rgb(19 19 19 / 92%);
        transition: all 0.6s cubic-bezier(.33,1,.68,1);
        cursor: pointer;
    }

    .btn-profile-active {
        background-color: aliceblue;
    }

    .btn-profile-active  .ntr-avatar  {
        filter: invert(1000%);
    }

    .btn-profile:hover {
        background-color: aliceblue;
    }

    .ntr-avatar {
        width: 26px;
        height: 26px;
        filter: invert(10%);
        transition: all 0.3s cubic-bezier(.33,1,.68,1);
        transform-origin: center center;
    }

    .register-logo {
        color: aliceblue;
        font-family: 'Open Sans';
        font-size: 18px;
        transition: all 0.3s ease;
    }

    .btn-profile:hover .register-logo {
        transform: scale(0.8);
        color: rgb(19 19 19);
    }

    .btn-profile-active  .register-logo  {
        color: rgb(19 19 19);
    }

    .btn-profile:hover .ntr-avatar {
        transform: scale(0.8);
        /* width: 21px;
        height: 21px; */
        filter: invert(1000%);
    }

    /* Стилізація модального вікна */
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        /* background: rgba(0, 0, 0, 0.5); */
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 999;
    }

    .modal-content {
        position: absolute;
        top: 3.325rem;
        right: 210px;
        background: #1c1c1c;
        /* padding: 20px; */
        border-radius: 5px;
        width: 340px;
        height: 200px;
        color: aliceblue;
        font-family: 'Open Sans';
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 1px 1px 12px 4px #00000021;
        animation: ShowModal 0.3s ease forwards;
    }

    @keyframes ShowModal {
        0% {
            transform: scale(0.5);
            top: 2.325rem;
            opacity: 0;
        }
        100% {
            transform: scale(1);
            top: 3.325rem;
            opacity: 1;
        }
    }

    .modal-content h2 {
        margin-top: 18px;
        position: relative;
        width: 75%;
        border-bottom: 1px solid aliceblue;
        text-align: center;
        padding-bottom: 5px;
    }

    .model-btn-close {
        position: absolute;
        right: 10px;
        top: 5px;
        border: none;
        background: none;
        font-size: 22px;
        width: 20px;
        height: 20px;
        color: #7c3a3a;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: all 0.2s ease;
    }

    .model-btn-close:hover {
        color: #d1c1c1;
    }
   
    .model-btn {
        margin: 10px 0;
        width: 100%;
        height: 35px;
        border-radius: 5px;
        border:none;
        background: aliceblue;
        font-family: 'Open Sans';
        font-size: 14px;
        transition: all 0.1s ease-in-out;
        cursor: pointer;
    }

    .model-btn-link{
        width: 75%;
        outline: none;
        text-decoration: none;
    }

    .model-btn:hover {
        background: #313131;
        color: aliceblue;
    }

</style>
