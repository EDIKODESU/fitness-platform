<template>
    <div class="login-content-box">
        <h2 class="login-form-headline">Вхід у систему</h2>
        <form @submit.stop class="login-form-profile">
            <div class="login-profile-box">
                <div class="login-param-box">
                    <label>Логін:</label>
                    <div class="input-box">
                        <input type="text" id="login" name="login" v-model="profileData.loginData" placeholder="Введіть логін або електронну адресу" required>
                    </div>
                </div>
                <div class="login-param-box">
                    <label>Пароль:</label>
                    <div class="input-box">
                        <input :type="showPassword ? 'text' : 'password'" id="password" v-model="profileData.password" name="password" placeholder="Введіть пароль" required>
                        <img class="showPassword" v-if="showPassword" src="../../../../public/password-state/close-eye.svg" @click="showPassword = !showPassword" alt="Hide password">
                        <img class="showPassword" v-else src="../../../../public/password-state/open-eye.svg" @click="showPassword = !showPassword" alt="Show password">
                    </div>
                </div>
            </div>

            <div class="login-button-box">
                <button @click.prevent="checkData" class="send">Увійти</button>
            </div>
        </form>
        <!-- <p class="err_box" v-show="err !== ''">{{ err }}</p> -->
        <p class="err_box" v-show="computedError !== ''">{{ computedError }}</p>
    </div>
</template>

<script>
    export default {
        name: "metrics",
        data() {
            return {
                profileData: {
                    loginData: "",
                    password: "",
                },
                err: "",
                showPassword: false
            }
        },
        props: {
            userNotExist: {
                type: String, // Тип пропсу як рядок
                required: false // Необов'язковий пропс
            }
        },
        computed: {
            computedError() {
                if (this.err !== '') { return this.err;} 
                else if (this.userNotExist !== '') { return this.userNotExist; }
                return '';
            }
        },
        methods: {
            checkData() {
                this.err = '';
                this.$emit('started-point-err', this.err);

                if(this.profileData.loginData.trim() == '' ||
                this.profileData.password.trim() == '') {
                    this.err = "Є пусті поля !";
                    return this.err;
                } 
                
                if (this.profileData.loginData.trim().length > 20) {
                    this.err = "Логін завеликий !";
                    return this.err;
                } else if (this.profileData.loginData.trim().length < 4) {
                    this.err = "Логін замалий !";
                    return this.err;
                }
                
                if (this.profileData.password.trim().length > 60) {
                    this.err = "Пароль завеликий !";
                    return this.err;
                } else if (this.profileData.password.trim().length < 5) {
                    this.err = "Пароль замалий !";
                    return this.err;
                }
                this.$emit('info-updated', this.profileData);
            },
        },
    };
</script>

<style scoped>
    .login-content-box {
        color: aliceblue;
        width: 95%;
        height: 92%;
        display: flex;
        /* justify-content: center; */
        align-items: center;
        flex-direction: column;
    }

    .login-form-headline {
        width: 100%;
        text-align: center;
        margin-bottom: 20px;
        font-family: 'Open Sans';
        padding-bottom: 10px;
        border-bottom: 1px solid white;
    }

    .login-form-profile {
        width: 100%;
        display: flex;
        /* justify-content: center; */
        align-items: center;
        flex-direction: column;
    }

    .login-profile-box {
        font-family: 'Open Sans';
        font-size: 20px;
        margin: 10px 0 12px 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 80%;
    }

    .login-param-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        margin-bottom: 25px;
    }

    .input-box {
        width: 390px;
        height: 38px;
        position: relative;
    }

    .input-box input {
        width: 88%;
        margin-left: 6px; 
        height: 85%;
        border: none;
    }

    .input-box input:focus {
        outline: none;
        border: none;
    }

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

    .login-button-box {
        width: 80%;
        display: flex;
        align-items: center;
        justify-content: center;
    }


</style>