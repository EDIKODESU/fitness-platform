<template>
    <Header></Header>
    <main class="main-profile-container">
       <div class="profile-box">
            <aside class="profile-aside-container">
                <div class="profile-aside-content">
                    <router-link class="link-box" to="/profile"><p>Профіль</p></router-link>
                    <router-link class="link-box" to="/update"><p>Оновити дані</p></router-link>
                </div>
            </aside>
            <div class="profile-info-container">
                <div class="profile-info-box">
                    <h1>Ваш профіль</h1>
                    <div class="profile-info">
                        <!-- <p v-for="(value, key) in user" :key="key">{{ key }}: {{ value }}</p> -->
                        <p>Нікнейм: {{ user.username }}</p>
                        <p>Ім'я: {{ user.firstName }}</p>
                        <p>Прізвище: {{ user.lastName }}</p>
                        <p>Логін: {{ user.login }}</p>
                        <p>Пошта: {{ user.email }}</p>
                        <p>Стать: {{ user.sex }}</p>
                        <p>Тип тіла: {{ user.body_type }}</p>
                        <p>Фізична активність: {{ user.activity }}</p>
                        <p>Вік: {{ user.age }}</p>
                        <p>Вага: {{ user.weight }}</p>
                        <p>Зріст: {{ user.height }}</p>
                        <p>Астма: {{ user.asthma? "є" : "немає" }}</p>
                        <p>Діабет: {{ user.diabetes? "є" : "немає" }}</p>
                        <p>Серцеві захворювання: {{ user.heart? "є" : "немає" }}</p>
                        <p>Проблеми з суглобами: {{ user.joints? "є" : "немає" }}</p>
                    </div>
                </div>
            </div>
       </div>
    </main>
    <Footer></Footer>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
import Header from "../../components/header/Header.vue";
import Footer from "../../components/footer/Footer.vue";
import router from '../../router';

export default {
    name: 'Note',
    data() {
        return {
            user: {},
        };
    },
    components: {
        Header,
        Footer
    },
    computed: {
        ...mapGetters(["getRegisterUserData"]),
    },
    methods: {
        ...mapActions(["getRegisterUser"]),
        async getUserInformation() {
            await this.getRegisterUser();
            const userData = this.getRegisterUserData;
            if (Object.keys(userData).length > 0) {
                this.user = userData;
            } else {
                console.log("err userData:", userData);
            }
        },
    },
    mounted() {
        if (sessionStorage.getItem("token")) {
            this.getUserInformation();
        } else { router.push("/login"); }
    }
};
</script>

<style scoped>
    .main-profile-container {
        width: 100%;
        min-height: calc(101vh - 3.325rem - 45px);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .profile-box {
        margin: 25px 0px 15px 0px;
        width: 72%;
        height: 100%;
        display: flex;
        align-items: center;
    }

    .profile-aside-container {
        height: 600px;
        padding: 5px;
        width: 300px;
        display: flex;
        flex-direction: column;
        align-items: center;
        font-family: 'Open Sans';
        border-right: 1px solid white;
        color: #686a6b;
    }

    .profile-aside-content {
        width: 100%;
        font-size: 17px;
    }

    .profile-aside-content p {
        margin: 10px 0px;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .profile-aside-content p:hover {
        color: aliceblue;
    }

    .profile-info-container {
        height: 100%;
        width: 100%;
        display: flex;
        justify-content: center;
    }

    .profile-info-box {
        height: 600px;
        width: 500px;
        padding: 5px;
        border-radius: 5px;
        display: flex;
        background: #1c1c1c;
        flex-direction: column;
        align-items: center;
        box-shadow: 0px 2px 13px 3px #0000003d;
    }

    .profile-info-box h1 {
        margin: 10px 0px;
        width: 90%;
        padding-bottom: 10px;
        border-bottom: 1px solid;
        color: aliceblue;
        text-align: center; 
    }

    .profile-info {
        width: 90%;
        height: 100%;
        font-family: 'Open Sans';
        font-size: 19px;
        color: #8a8c8e;
    }

    .profile-info-box p {
        margin: 5px 0px;
    }

</style>