<template>
    <div class="register-card">
        <div class="card-content">
            <h2 class="register-form-headline">Метричні дані</h2>
            <p class="description-form">Заповніть дані, щоб підібрати найбільш підходящі тренування та харчування для Вас</p>
            <form class="register-form-mertics">
         
                <div class="register-param-box">
                    <label>Напишіть свій вік:</label>
                    <div class="input-box">
                        <input type="number" id="age" name="age" v-model="metricsData.age" required>
                    </div>
                </div>

                <div class="register-param-box">
                    <label>Напишість Вашу вагу (кг):</label>
                    <div class="input-box">
                        <input type="number" id="weight" name="weight" step="0.01" v-model="metricsData.weight" required>
                    </div>
                </div>

                <div class="register-param-box">
                    <label>Напишість свій зріст (см):</label>
                    <div class="input-box">
                        <input type="number" id="height" name="height" step="0.01" v-model="metricsData.height" required>
                    </div>
                </div>

                <div class="register-bt-box">
                    <label>Оберіть свій тип тіла:</label>
                    <select id="body_type" name="body_type" v-model="metricsData.body_type">
                        <option value="ектоморф">Ектоморф</option>
                        <option value="мезоморф">Мезоморф</option>
                        <option value="ендоморф">Ендоморф</option>
                    </select>
                </div>

                <div class="register-activity-box">
                    <label>Оберіть свій фізичний рівень активності:</label>
                    <select id="activity" name="activity" v-model="metricsData.activity">
                        <option value="легка">Легка</option>
                        <option value="середня">Середня</option>
                        <option value="висока">Висока</option>
                    </select>
                </div>

                <div class="register-sex-box">
                    <label>Оберіть свою стать:</label>
                    <div class="choose-sex-box">
                        <div class="sex-box-element">
                            <label for="female">Жінка</label>
                            <input type="radio" id="female" name="sex" value="жінка" v-model="metricsData.sex">
                        </div>
                        <div class="sex-box-element">
                            <label for="male">Чоловік</label>
                            <input type="radio" id="male" name="sex" value="чоловік" v-model="metricsData.sex">
                        </div>
                    </div>
                </div>

                <div class="register-button-box">
                    <button @click.prevent="checkData" class="next">Далі</button>
                </div>
            </form>
        </div>
        <p class="err_box" v-show="err !== ''">{{ err }}"</p>
    </div>
</template>

<script>
    export default {
        name: "metrics",
        data() {
            return {
                metricsData: {
                    body_type: "",
                    activity: "",
                    sex: "",
                    age: 0,
                    weight: 0.0,
                    height: 0.0,
                },
                err: ""
            }
        },
        methods: {
            checkData() {
                this.err = ''
                if(this.metricsData.age < 13) {
                    this.err = "Повноцінно займатися можна лише з 13 років !";
                    return this.err;
                } else if(this.metricsData.age > 100) {
                    this.err = "Завеликий вік !";
                    return this.err;
                }
                if(this.metricsData.weight < 22) {
                    this.err = "Занадто мала вага !";
                    return this.err;
                } else if(this.metricsData.weight > 400) {
                    this.err = "Занадто велика вага !";
                    return this.err;
                }
                if(this.metricsData.height < 120) {
                    this.err = "Занадто малий зріст !";
                    return this.err;
                } else if(this.metricsData.height > 220) {
                    this.err = "Занадто великий зріст !";
                    return this.err;
                }
                if(this.metricsData.activity == '' || this.metricsData.body_type == ''  ||  this.metricsData.sex == ''  ) {
                    this.err = "Є пусті поля !";
                    return this.err;
                }
                this.$emit('metrics-updated', this.metricsData);
            },
        },
    };
</script>

<style scoped>
    .register-form-mertics {
        margin-top: 18px;
        width: 100%;
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    .register-param-box {
        width: 72%;
    }

    .register-bt-box, .register-activity-box, .register-sex-box  {
        width: 72%;
        display: flex;
        justify-content: space-between;
        margin-bottom: 8px;
        font-family: 'Open Sans';
        font-size: large;
    }

    .register-bt-box select, .register-activity-box select {
        width: 120px;
        border: none;
        background: none;
        color: aliceblue;
        font-family: 'Open Sans';
        font-size: large;
        cursor: pointer;
    }

    .register-bt-box select:hover, .register-activity-box select:hover {
        background: rgb(19, 19, 19);
    }

    .register-bt-box option, .register-activity-box option {
        background-color: rgb(19, 19, 19);
        border: none;
    }

    .register-sex-box label {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .register-sex-box input:checked {
        accent-color: #b3dc62;
    }

    .choose-sex-box {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .sex-box-element {
        display: flex;
        width: 115px;
        justify-content: space-between;
        align-items: center;
        cursor: pointer;
    }

    .sex-box-element label, .sex-box-element {
        cursor: pointer;
    }

    .sex-box-element:hover {
        background-color: rgb(19, 19, 19);
    }
</style>