<template>
    <div class="register-card">
        <div class="card-content">
            <h2 class="register-form-headline">Профільні дані</h2>
            <p class="description-form">Заповніть поля, щоб створити свій обліковий запис</p>
            <form @submit.stop class="register-form-profile">
                <div class="regoster-profile-box">
                    <div class="register-param-box">
                        <label>Нікнейм:</label>
                        <div class="input-box">
                            <input type="text" id="username" name="username" v-model="profileData.username" required>
                        </div>
                    </div>
                    <div class="register-param-box">
                        <label>Ім'я:</label>
                        <div class="input-box">
                            <input type="text" id="firstName" name="firstName" v-model="profileData.firstName" required>
                        </div>
                    </div>
                    <div class="register-param-box">
                        <label>Прізвище:</label>
                        <div class="input-box">
                            <input type="text" id="lastName" name="lastName" v-model="profileData.lastName" required>
                        </div>
                    </div>
                    <div class="register-param-box">
                        <label>Логін:</label>
                        <div class="input-box">
                            <input type="text" id="login" name="login" v-model="profileData.login" required>
                        </div>
                    </div>
                    <div class="register-param-box">
                        <label>Пароль:</label>
                        <div class="input-box">
                            <input :type="showPassword ? 'text' : 'password'" id="password" v-model="profileData.password" name="password" required>
                            <!-- <input type="checkbox" v-model="showPassword" id="showPassword"> -->
                            <img class="showPassword" v-if="showPassword" src="../../../../public/password-state/close-eye.svg" @click="showPassword = !showPassword" alt="Hide password">
                            <img class="showPassword" v-else src="../../../../public/password-state/open-eye.svg" @click="showPassword = !showPassword" alt="Show password">
                        </div>
                    </div>
                    <div class="register-param-box">
                        <label>Пошта:</label>
                        <div class="input-box">
                            <input type="email" id="email" name="email" v-model="profileData.email" required>
                        </div>
                    </div>
                </div>

                <div class="register-button-box">
                    <button @click.prevent="prevCard" class="back">Назад</button>
                    <button @click.prevent="checkData" class="send">Зареєструватися</button>
                </div>
            </form>
            <!-- <p class="err_box" v-show="err !== ''">{{ err !=='' ? err :(userExist !=='' ? err = userExist: '') }}</p> -->
            <p class="err_box" v-show="computedError !== ''">{{ computedError }}</p>
        </div>
    </div>
</template>

<script>
    export default {
        name: "metrics",
        data() {
            return {
                profileData: {
                    login: "",
                    password: "",
                    username: "",
                    firstName: "",
                    lastName: "",
                    email: "",
                },
                err: "",
                showPassword: false
            }
        },
        props: {
            prevCard: {
                type: Function, // Вказуємо тип пропсу як функцію
                required: true // Опціонально, вказуємо, що це обов'язковий пропс
            },
            userExist: {
                type: String, // Тип пропсу як рядок
                required: false // Необов'язковий пропс
            }
        },
        computed: {
            computedError() {
                if (this.err !== '') { return this.err;} 
                else if (this.userExist !== '') { return this.userExist; }
                return '';
            }
        },
        methods: {
            checkData() {
                this.err = '';
                this.$emit('started-point-err', this.err);
                
                const username = this.profileData.username.trim();
                const login = this.profileData.login.trim();
                const password = this.profileData.password.trim();
                const firstName = this.profileData.firstName.trim();
                const lastName = this.profileData.lastName.trim();
                const email = this.profileData.email.trim();
                
                // Перевірка на заповненість полів
                if (!username || !login || !password || !firstName || !lastName || !email) {
                    this.err = "Заповніть усі поля!";
                    this.$emit('started-point-err', this.err);
                    return;
                }
                
                // Перевірка довжини полів
                if (username.length > 45) {
                    this.err = "Нікнейм завеликий!";
                    this.$emit('started-point-err', this.err);
                    return;
                } else if (username.length < 3) {
                    this.err = "Нікнейм замалий!";
                    this.$emit('started-point-err', this.err);
                    return;
                }
                
                if (firstName.length > 45) {
                    this.err = "Вкажіть менше ім'я!";
                    this.$emit('started-point-err', this.err);
                return;
                } else if (firstName.length < 3) {
                    this.err = "Ім'я замале!";
                    this.$emit('started-point-err', this.err);
                    return;
                }
                
                if (lastName.length > 45) {
                    this.err = "Вкажіть менше прізвище!";
                    this.$emit('started-point-err', this.err);
                    return;
                } else if (lastName.length < 3) {
                    this.err = "Прізвище замале!";
                    this.$emit('started-point-err', this.err);
                    return;
                }
                
                if (login.length > 20) {
                    this.err = "Логін завеликий!";
                    this.$emit('started-point-err', this.err);
                    return;
                } else if (login.length < 4) {
                    this.err = "Логін замалий!";
                    this.$emit('started-point-err', this.err);
                    return;
                }
                
                if (password.length > 60) {
                    this.err = "Пароль завеликий!";
                    this.$emit('started-point-err', this.err);
                    return;
                } else if (password.length < 5) {
                    this.err = "Пароль замалий!";
                    this.$emit('started-point-err', this.err);
                    return;
                }
                
                // Валідація електронної пошти
                    if (!this.validateEmail(email)) {
                    this.err = "Невірний формат електронної пошти!";
                    this.$emit('started-point-err', this.err);
                    return;
                }
                
                if (email.length > 45) {
                    this.err = "Вкажіть меншу за розміром пошту!";
                    this.$emit('started-point-err', this.err);
                    return;
                }

                // Всі перевірки пройдені, дані валідні
                this.$emit('profile-info-updated', this.profileData);
            },
            validateEmail(email) {
                const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return emailPattern.test(email);
            }
        }
    };
</script>

<style scoped>
    .register-form-profile {
        margin-top: 5px;
        display: flex;
        flex-direction: column;
        align-items: center;
        color: aliceblue;
        width: 95%;
    }

    .regoster-profile-box {
        margin: 10px 0 12px 0;
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        align-items: center;
        width: 100%;
    }

    .register-param-box {
        width: 80%;
    }

    .input-box {
        width: 460px;
        height: 30px;
        position: relative;
    }

    /* #password {

    } */

    .showPassword {
        cursor: pointer;
        position: absolute;
        width: 20px;
        right: 10px;
        transition: all 0.2s ease
    }

    .showPassword:hover {
        transform: scale(0.9);
    }

    .register-button-box {
        width: 80%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

</style>