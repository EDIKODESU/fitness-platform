<template>
    <Header></Header>
    <main class="login-container">
        <h1 class="title-name">Авторизація</h1>
        <div class="login-form-content">
            <LoginForm :userNotExist="err"  @info-updated="updateInfo" @started-point-err="startedPointErr"></LoginForm>
        </div>
    </main>
    <Footer></Footer>
</template>

<script>
    import {mapActions, mapGetters} from "vuex";
    import router from '../../router';
    import Header from "../../components/header/Header.vue";
    import Footer from "../../components/footer/Footer.vue";
    import LoginForm from "./form/LoginForm.vue";

    export default {
        name: "login",
        data() {
            return {
                dto: {
                    loginData: "",
                    password: "",
                },
                err: ""
            }
        },
        computed: {
            ...mapGetters(["getAuthStatus"]),
        },
        methods: {
            ...mapActions(['postLogin']),
            // ...mapGetters(["getAuthStatus"]),
            startedPointErr(err){
                this.err = err;
            },
            async authorizationUser(){
                await this.postLogin(this.dto);
                const status = await this.getAuthStatus;
                console.log(status);
                if(!status) {
                    this.err = "Такого користувача не існує";
                    this.dto = {};
                    return;
                }
                this.err = "";
                router.push('/home');
            
            },
            updateInfo(profileData) {
                this.dto.loginData = profileData.loginData;
                this.dto.password = profileData.password;
                this.authorizationUser();
            },
        },
        mounted() {
            if (sessionStorage.getItem("token")) {
                router.push("/home"); 
            }
        },
        components: {
            Header,
            Footer,
            LoginForm
        }
    };
</script>

<style>

    .login-container {
        width: 100%;
        /* min-height: 100vh; */
        min-height: calc(100vh - 3.325rem - 45px);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .login-form-content {
        display: flex;
        margin-top: 15px;
        /* margin: auto; */
        width: 650px;
        border-radius: 10px;
        height: 320px;
        background: #1c1c1c;
        align-items: center;
        flex-direction: column;
        justify-content: center;
        box-shadow: 1px 1px 12px 4px #00000021;
        position: relative;
    }
</style>