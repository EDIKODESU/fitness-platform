<template>
    <Header></Header>
    <main class="update-container">
        <form class="update-form-container">
            <h1>Оновлення даних</h1>
            <div class="update-form-box">
                <p>Профільні дані</p>
                <div class="general-input-field-box">
                    <p>Логін</p>
                    <input type="text" v-model="login" placeholder="Оновлення логіну">
                </div>
                <div class="general-input-field-box">
                    <p>Ім'я</p>
                    <input type="text" v-model="firstName" placeholder="Оновлення ім'я">
                </div>
                <div class="general-input-field-box">
                    <p>Прізвище</p>
                    <input type="text" v-model="lastName" placeholder="Оновлення прізвища">
                </div>
                <div class="general-input-field-box">
                    <p>Нікнейм</p>
                    <input type="text" v-model="username" placeholder="Оновлення нікнейму">
                </div>
                <div class="general-input-field-box">
                    <p>Пошта</p>
                    <input type="email" v-model="email" placeholder="Оновлення пошти">
                </div>
            </div>
            <div class="update-form-box">
                <p>Метричні дані</p>

                <div class="update-radio-container">
                    <div class="update-radio-box">
                        <div class="btn-radio">
                            <input type="radio" id="female" name="sex" value="жінка" v-model="sex">
                            <label for="female">Жінка</label>
                        </div>
                        <div class="btn-radio">
                            <input type="radio" id="male" name="sex" value="чоловік" v-model="sex">
                            <label for="male">Чоловік</label>
                        </div>
                    </div>
                </div>

                <div class="general-input-field-box">
                    <p>Вага</p>
                    <input type="number" v-model="weight" placeholder="Оновлення ваги">
                </div>

                <div class="general-input-field-box">
                    <p>Зріст</p>
                    <input type="number" v-model="height" placeholder="Оновлення зросту">
                </div>

                <div class="general-input-field-box">
                    <p>Вік</p>
                    <input type="number" v-model="age" placeholder="Оновлення віку">
                </div>

                <div class="update-radio-container">
                    <p>Фізична активність</p>
                    <div class="update-radio-box">
                        <div class="btn-radio">
                            <input type="radio" id="light" name="activity" value="легка" v-model="activity">
                            <label for="light">Легка</label>
                        </div>
                        <div class="btn-radio">
                            <input type="radio" id="average" name="activity" value="середня" v-model="activity">
                            <label for="average">Середня</label>
                        </div>
                        <div class="btn-radio">
                            <input type="radio" id="high" name="activity" value="висока" v-model="activity">
                            <label for="high">Висока</label>
                        </div>
                    </div>
                </div>

                <div class="update-radio-container">
                    <p>Тип тіла</p>
                    <div class="update-radio-box">
                        <div class="btn-radio">
                            <input type="radio" id="ectomorph" name="body_type" value="ектоморф" v-model="body_type">
                            <label for="ectomorph">Ектоморф</label>
                        </div>
                        <div class="btn-radio">
                            <input type="radio" id="mesomorph" name="body_type" value="мезоморф" v-model="body_type">
                            <label for="mesomorph">Мезоморф</label>
                        </div>
                        <div class="btn-radio">
                            <input type="radio" id="endomorph" name="body_type" value="ендоморф" v-model="body_type">
                            <label for="endomorph">Ендоморф</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="update-form-box">
                <p>Дані захворювань</p>
                <div class="update-disease-container">
                    <div class="disease-name-box">
                        <img class="disease-img" src="../../../../public/diseases/asthma.svg" alt="asthma">
                        <label for="asthma">Астма:</label>
                    </div>
                    <input type="checkbox" v-model="asthma" id="asthma" name="asthma" value="asthma">
                </div>

                <div class="update-disease-container">
                    <div class="disease-name-box">
                        <img class="disease-img" src="../../../../public/diseases/diabetes.svg" alt="diabetes">
                        <label for="diabetes">Діабет:</label>
                    </div>
                    <input type="checkbox" v-model="diabetes" id="diabetes" name="diabetes" value="diabetes">
                </div>

                <div class="update-disease-container">
                    <div class="disease-name-box">
                        <img class="disease-img" src="../../../../public/diseases/heart.svg" alt="heart">
                        <label for="heart">Серцеві захворювання:</label>
                    </div>
                    <input type="checkbox" v-model="heart"  id="heart" name="heart" value="heart">
                </div>

                <div class="update-disease-container">
                    <div class="disease-name-box">
                        <img class="disease-img" src="../../../../public/diseases/joints.svg" alt="joints">
                        <label for="joints">Проглеми з суглобами:</label>
                    </div>
                    <input type="checkbox" v-model="joints"  id="joints" name="joints" value="joints">
                </div>
            </div>
            <div class="update-btn-box">

                <router-link class="link-box" to="/home">
                    <button class="update-btn">
                        <p>На головну</p>
                    </button>
                </router-link>

                <button @click.prevent="checkData" class="update-btn"> 
                    <p>Оновити</p>    
                </button>
            </div>
            <p class="ending-text" v-if="!err && ending_text !== ''"> {{ ending_text }}</p>
            <p class="err-ending-text" v-else-if="err && ending_text !== ''" >{{ ending_text }}</p>
        </form>
    </main>
    <Footer></Footer>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import Header from "../../components/header/Header.vue";
import Footer from "../../components/footer/Footer.vue";
import router from '../../router';

export default {
    name: 'UpdatePage',
    data() {
        return {
            body_type: "",
            activity: "",
            sex: "",
            age: 0,
            weight: 0.0,
            height: 0.0,
            joints: false,
            heart: false,
            diabetes: false,
            asthma: false,
            login: "",
            username: "",
            firstName: "",
            lastName: "",
            email: "",
            ending_text: "",
            err: false
        };
    },
    computed: {
        ...mapGetters(["getStatusUpdate", "getRegisterUserData"]),
    },
    methods: {
        ...mapActions(["updateUserData", "getRegisterUser"]),
        checkData() {
            let dto = {};
            this.err = false;
            this.ending_text = "";

            if( this.body_type === "" && this.activity === "" && this.sex === "" &&
            this.age === 0 && this.weight === 0.0 && this.height === 0.0 && this.joints === false &&
            this.heart === false && this.diabetes === false && this.asthma === false && this.login === "" &&
            this.username === "" && this.firstName === "" && this.lastName === "" && this.email === "") {
                this.err = true;
                this.ending_text = "Дані не можуть бути оновлені!";
                return;
            }

            if(this.login !== "") {
                if (this.login.length > 20) {
                    this.err = true;
                    this.ending_text = "Логін завеликий!";
                    return;
                } else if (this.login.length < 4) {
                    this.err = true;
                    this.ending_text = "Логін замалий!";
                    return;
                }
                dto.login = this.login;
            }

            if(this.firstName !== "") {
                if (this.firstName.length > 45) {
                    this.err = true;
                    this.ending_text = "Вкажіть менше ім'я!";
                    return;
                return;
                } else if (this.firstName.length < 3) {
                    this.err = true;
                    this.ending_text = "Ім'я замале!";
                    return;
                }
                dto.firstName = this.firstName;
            }

            if(this.lastName !== "") {
                if (this.lastName.length > 45) {
                    this.err = true;
                    this.ending_text = "Вкажіть менше прізвище!";
                    return;
                return;
                } else if (this.lastName.length < 3) {
                    this.err = true;
                    this.ending_text = "Прізвище замале!";
                    return;
                }
                dto.lastName = this.lastName;
            }

            if(this.username !== "") {
                if (this.username.length > 45) {
                    this.err = true;
                    this.ending_text = "Нікнейм завеликий!";
                    return;
                return;
                } else if (this.username.length < 3) {
                    this.err = true;
                    this.ending_text = "Нікнейм замалий!";
                    return;
                }
                dto.username = this.username;
            }

            if(this.email !== "") {
                if (!this.validateEmail(this.email)) {
                    this.err = true;
                    this.ending_text = "Невірний формат електронної пошти!"
                    return;
                }
                if (this.email.length > 45) {
                    this.err = true;
                    this.ending_text = "Вкажіть меншу за розміром пошту!";
                    return;
                }
                dto.email = this.email;
            }

            if(this.age !== 0) {
                if(this.age < 13) {
                    this.err = true;
                    this.ending_text = "Повноцінно займатися можна лише з 13 років!";
                    return;
                } else if(this.age > 100) {
                    this.err = true;
                    this.ending_text = "Завеликий вік!";
                    return;
                }
                dto.age = this.age;
            }
                                       
            if(this.weight !== 0.0) {
                if(this.weight < 22) {
                    this.err = true;
                    this.ending_text = "Занадто мала вага!";
                    return;
                } else if(this.weight > 400) {
                    this.err = true;
                    this.ending_text = "Занадто велика вага!";
                    return;
                }
                dto.weight = this.weight;
            }

            if(this.height !== 0.0) {
                if(this.height < 120) {
                    this.err = true;
                    this.ending_text = "Занадто малий зріст!";
                    return;
                } else if(this.height > 220) {
                    this.err = true;
                    this.ending_text = "Занадто великий зріст!";
                    return;
                }
                dto.height = this.height;
            }

            if(this.activity !== "") { dto.activity = this.activity; }
            if(this.body_type !== "") { dto.body_type = this.body_type; }
            if(this.sex !== "") { dto.sex = this.sex; }

            dto.joints = this.joints;
            dto.heart = this.heart;
            dto.diabetes = this.diabetes;
            dto.asthma = this.asthma;

            this.updateData(dto);
        },
        validateEmail(email) {
                const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return emailPattern.test(email);
        },
        async updateData(dto) {
            await this.getRegisterUser();
            const registerUser = this.getRegisterUserData;
            if(Object.keys(registerUser).length > 0) {
                for (let key in registerUser) {
                    if (!(key in dto)) {
                        dto[key] = registerUser[key];
                    }
                }
                await this.updateUserData(dto);
                if (this.getStatusUpdate) {
                    this.ending_text = 'Дані оновлено!'
                    // router.push("/home"); 
                    return;
                } else {
                    this.err = true;
                    this.ending_text = "Дані не оновлені";
                    return;
                }
            } else {
                this.err = true;
                this.ending_text = "Дані не оновлені";
                return;
            }
        },
    },
    components: {
        Header,
        Footer,
    },
    mounted() {
        if (!sessionStorage.getItem("token")) { router.push("/login"); } 
    }
};
</script>

<style scoped>
    .update-container {
        width: 100%;
        min-height: calc(100vh - 3.325rem - 45px);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .update-form-container {
        width: 700px;
        padding: 5px;
        border-radius: 5px;
        background: #1c1c1c;
        color: aliceblue;
        font-family: 'Open Sans';
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 25px 0px;
        box-shadow: 0px 2px 13px 3px #0000003d;
    }

    .update-form-container h1 {
        margin: 5px 0px;
    }

    .update-form-box {
        width: 72%;
        display: flex;
        flex-direction: column;
        align-items: center;
        font-size: 20px;
        padding: 15px 0px 10px 0px;
        border-top: 1px solid aliceblue;
    }

    .update-form-box p {
        margin-bottom: 5px;
    }

    .general-input-field-box {
        width: 100%;
        display: flex;
        flex-direction: column;
    }   

    .general-input-field-box input {
        background: #2c2c2c;
        border: none;
        height: 30px;
        border-radius: 3px;
        padding-left: 15px;
        color: #9f9f9f;
        font-size: 14px;
        transition: all 0.2s ease;
        margin: 3px 0px;
    }

    .general-input-field-box input:focus {
        border: none;
        outline: none;
        background: #3e4545;;
        color: aliceblue;
    }

    .update-radio-container {
        margin: 8px 0px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .update-radio-box {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px 10px;
        border-radius: 3px;
        background: #2c2c2c;
    }

    .btn-radio {
        min-width: 200px;
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
    }

    .btn-radio label {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 5px;
        transition: all 0.1s ease-out;
        /* font-weight: bold; */
        cursor: pointer;
    }

    .btn-radio input[type="radio"] {
        opacity: 0;
        width: 0;
        height: 0;
        position: absolute;
    }

    .btn-radio input[type="radio"]:checked + label {
        /* background-color: #597797; */
        background-color: aliceblue;
        color: rgb(19, 19, 19);
    }

    .update-disease-container {
        display: flex;
        width: 100%;
        margin: 8px 0px;
        justify-content: space-between;
    }

    .update-disease-container input[type="checkbox"]  {
        width: 25px;
        accent-color: #b3dc62;
        cursor: pointer;
    }

    .disease-name-box {
        display: flex;
        /* width: 300px; */
        justify-content: flex-start;
        align-items: center;
    }

    .disease-name-box label {
        cursor: pointer;
        margin-left: 10px;
    }

    .disease-img {
        width: 30px;
        border-radius: 5px;
        padding: 5px;
        background: aliceblue;
    }

    .update-btn-box {
        display: flex;
        width: 100%;
        justify-content: space-evenly;
        margin: 15px 0px 25px 0px;
    }

    .update-btn {
        cursor: pointer;
        border-radius: 5px;
        height: 50px;
        width: 220px;
        background: #dfeaf3;
        font-size: 17px;
        font-family: 'Open Sans';
        transition: all 0.2s ease;
        color: rgb(19, 19, 19);
        border: none;
    }

    .update-btn p {
        transition: all 0.21s ease;
    }

    .update-btn:hover {
        /* background-color: #496074; */
        background-color: #496074;
        color: aliceblue;
        font-weight: bold;
    }

    .update-btn:hover p {
        scale: 0.8;
    }

    .ending-text, .err-ending-text {
        width: 100%;
        text-align: center;
        margin: 5px 0px;
        font-size: 17px;
    }

    .ending-text {
        color: #639064;
    }

    .err-ending-text {
        color: #9f4a4a;
    }

</style>