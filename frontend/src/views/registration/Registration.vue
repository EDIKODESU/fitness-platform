<template>
    <Header></Header>
    <main class="register-container">
        <h1 class="title-name">Реєстрація</h1>
        <div class="register-content">
            <div class="register-cards-form" :style="{ transform: `translateX(-${currentCardIndex * (100/3)}%)` }">
                <MetricsForm ref="metricsForm" @metrics-updated="updateMetrics"></MetricsForm>
                <DiseasesForm  ref="diseasesForm" :prevCard="prevCard" @diseases-updated="updateDiseases"></DiseasesForm>
                <ProfileForm :userExist="err" :prevCard="prevCard" @profile-info-updated="updateProfile" @started-point-err="startedPointErr"></ProfileForm>
            </div>
        </div>
        <div class="register-steps-box">
            <div class="register-steps">
                <p @click.prevent="clickCard(0)" :class="{ 'step-name': true, 'active-step': currentCardIndex > 0 }">{{ currentCardIndex > 0 ? '✓' : 'I' }}</p>
                <p :class="{ 'step-design': true, 'step-design-left': currentCardIndex > 0 }">..........</p>
                <p @click.prevent="clickCard(1)" :class="{ 'step-name': true, 'active-step': currentCardIndex > 1 }">{{ currentCardIndex > 1 ? '✓' : 'II' }}</p>
                <p :class="{ 'step-design': true, 'step-design-left': currentCardIndex > 1 }">..........</p>
                <p @click.prevent="clickCard(2)" :class="{ 'step-name': true, 'active-step': currentCardIndex > 2 }">{{ currentCardIndex > 2 ? '✓' : 'III' }}</p>
            </div>
            <p>Кроки</p>
        </div>
    </main>
    <Footer></Footer>
</template>

<script>
    import {mapActions, mapGetters} from "vuex";
    import router from '../../router';
    import Header from "../../components/header/Header.vue";
    import Footer from "../../components/footer/Footer.vue";
    import MetricsForm from "./form/Metrics.vue";
    import DiseasesForm from "./form/Diseases.vue";
    import ProfileForm from "./form/Profile.vue";

    export default {
        name: "registration",
        data() {
            return {
                dto: {
                    login: "",
                    password: "",
                    username: "",
                    firstName: "",
                    lastName: "",
                    email: "",
                    body_type: "",
                    activity: "",
                    sex: "",
                    age: 0,
                    weight: 0.0,
                    height: 0.0,
                    asthma: false,
                    diabetes: false,
                    heart: false,
                    joints: false,
                },
                err: "",
                currentCardIndex: 0,
            }
        },
        computed: {
            ...mapGetters(["getAuthStatus"]),
        },
        methods: {
            ...mapActions(['postRegister']),
            // ...mapGetters(["getAuthStatus"]),
            async registrationUser(){
                await this.postRegister(this.dto);
                const status = this.getAuthStatus;
                console.log(status);
                if(!status) {
                    this.err = "Такий користувач вже існує";
                    this.dto = {};
                    return;
                }
                this.err = "";
                router.push('/home');
            
            },
            updateMetrics(metricsData) {
                // оновлюємо дані метрик у батьківському компоненті
                this.dto.body_type = metricsData.body_type;
                this.dto.activity = metricsData.activity;
                this.dto.sex = metricsData.sex;
                this.dto.age = metricsData.age;
                this.dto.weight = metricsData.weight;
                this.dto.height = metricsData.height;
                this.nextCard();
            },
            updateDiseases(diseasesData) {
                // оновлюємо дані захворювань у батьківському компоненті
                this.dto.asthma = diseasesData.asthma;
                this.dto.joints = diseasesData.joints;
                this.dto.diabetes = diseasesData.diabetes;
                this.dto.heart = diseasesData.heart;
                this.nextCard();
            },
            updateProfile(profileData) {
                this.dto.username = profileData.username;
                this.dto.firstName = profileData.firstName;
                this.dto.lastName = profileData.lastName;
                this.dto.login = profileData.login;
                this.dto.password = profileData.password;
                this.dto.email = profileData.email;
                
                // Перевірка, чи всі поля не є порожніми
                const emptyDto = this.checkFormDTO();
                if (emptyDto) {
                    console.log("Some fields are empty. Metrics and diseases forms won't be checked.");
                } else {
                    // Перевірка даних у дочірніх компонентах тільки якщо всі поля заповнені
                    const metricsForm = this.$refs.metricsForm;
                    const diseasesForm = this.$refs.diseasesForm;
                    metricsForm.checkData();
                    diseasesForm.checkData();
                }
                this.registrationUser();
            },
            checkFormDTO() {
                for (const key in this.dto) {
                    if (this.dto.hasOwnProperty(key)) {
                        const value = this.dto[key];
                        if (value === '' || value === 0 || value === false) {
                            return true; // Якщо хоча б одне поле порожнє, повертаємо true
                        }
                    }
                }
                return false; // Якщо всі поля заповнені, повертаємо false
            },
            startedPointErr(err){
                this.err = err;
            },
            clickCard(n) {
                // Отримуємо посилання на дочірній компонент
                const metricsForm = this.$refs.metricsForm;
                const diseasesForm = this.$refs.diseasesForm;
                // Перевіряємо, чи маємо доступ до методу checkData()
                if (metricsForm && metricsForm.checkData) {
                    const err = metricsForm.checkData();
                    if(err) return;
                }
                if (diseasesForm && diseasesForm.checkData) {
                    diseasesForm.checkData();
                }
                this.currentCardIndex = n;
            },
            nextCard() {
                if(this.currentCardIndex < 2) { this.currentCardIndex++; }
            },
            prevCard() {
                this.currentCardIndex--;
            }
        },
        mounted() {
            if (sessionStorage.getItem("token")) {
                router.push("/home"); 
            }
        },
        components: {
            Header,
            Footer,
            MetricsForm,
            DiseasesForm,
            ProfileForm
        }
    };
</script>

<style>

    .title-name {
        color: #b8c3cc;
        font-family: 'Open Sans';
    }

    .register-container {
        width: 100%;
        /* min-height: 100vh; */
        min-height: calc(100vh - 3.325rem - 45px);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .register-content {
        margin: 10px 0 10px 0;
        width: 100%;
        overflow: hidden;
        position: relative;
        scrollbar-width: none;
    }

    .register-cards-form {
        width: calc(100% * 3);
        display: flex;
        flex-wrap: nowrap;
        align-items: center;
        transition: all 0.5s ease;
    }

    .register-card {
        display: flex;
        margin: auto;
        width: 850px;
        border-radius: 10px;
        height: 440px;
        background: #1c1c1c;
        align-items: center;
        flex-direction: column;
        justify-content: center;
        box-shadow: 1px 1px 12px 4px #00000021;
        position: relative;
    }

    .card-content {
        color: aliceblue;
        width: 95%;
        height: 92%;
    }

    .register-form-headline {
        text-align: center;
        margin-bottom: 20px;
        font-family: 'Open Sans';
        padding-bottom: 10px;
        border-bottom: 1px solid white;
    }

    .description-form {
        text-align: center;
        font-family: 'Open Sans';
        font-size: smaller;
    }

    .register-param-box {
        /* width: 72%; */
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 8px;
        font-family: 'Open Sans';
        font-size: large;
    }

    .input-box {
        border-radius: 3px;
        width: 175px;
        display: flex;
        /* justify-content: center; */
        align-items: center;
        height: 30px;
        background: white;
    }

    .register-param-box input {
        color: rgb(19, 19, 19);
        border: none;
        width: 88%;
        height: 85%;
        /* height: 100%; */
        margin-left: 6px;
        /* color: transparent; */
    }

    .register-param-box input:focus {
        outline: none;
        border: none;
    }

    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
    }

    .next, .back, .send  {
        margin: 5px 0;
        border: none;
        font-weight: 500;
        font-size: 17px;
        font-family: 'Open Sans';
        border-radius: 8.5px;
        height: 34px;
        width: 200px;
        transition: all 0.46s ease-out;
        cursor: pointer;
        color: aliceblue;
        background-color: #1c1c1c;
        position: relative;
        /* border-bottom: 1px solid aliceblue; */
    }

    .next::after, .back::after, .send::after {
        content: ""; /* Додаємо пустий контент */
        position: absolute; /* Абсолютне позиціонування відносно .next */
        bottom: 2px; /* Розміщуємо лінію внизу */
        left: 50%; /* Починаємо лінію з середини .next */
        transform: translateX(-50%); /* Зсуваємо лінію на половину своєї ширини вліво */
        width: 25%; /* Ширина лінії - 25% */
        height: 1.5px; /* Висота лінії */
        background-color: aliceblue; /* Колір лінії */
        transition: all 0.5s ease;
    }

    .next:hover, .back:hover  {
        color: rgb(19, 19, 19);
        background-color: rgb(248, 248, 248);
    }

    .next:hover::after, .back:hover::after, .send:hover::after {
        width: 75%;
        background-color: rgb(19, 19, 19);
    }

    .send:hover {
        color: rgb(19, 19, 19);
        background-color: aliceblue;
    }


    .err_box {
        color: #8b2020;
        font-family: 'Open Sans';
        position: absolute;
        bottom: 15px;
        left: 50%; 
        transform: translateX(-50%); 
    }

    .register-steps-box {
        color: aliceblue;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }

    .register-steps {
        user-select: none;
        margin: 10px 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .step-name {
        margin: 0 5px;
        font-family: sans-serif;
        font-weight: bold;
        font-size: 15px;
        color: rgb(19, 19, 19);
        display: flex;
        background: aliceblue;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        transition: all 0.25s ease;
    }

    .step-name:hover {
        color: aliceblue;
        background: rgb(19, 19, 19);
        transition: all .3s ease;
    }

    .active-step {
        background: #b3dc62; 
    }

    .step-design {
        font-weight: bold;
        background: linear-gradient(to left, aliceblue 50%, #b3dc62 50%) right;
        background-clip: text; /* Вказуємо, що градієнт має бути застосований до тексту */
        -webkit-background-clip: text; /* Для сумісності з браузерами на основі WebKit */
        color: transparent; /* Зробити текст прозорим, щоб відображати градієнт */
        background-size: 200%;
        transition: .5s ease-out;
    }

    .step-design-left {
        background-position: left
    }

</style>
