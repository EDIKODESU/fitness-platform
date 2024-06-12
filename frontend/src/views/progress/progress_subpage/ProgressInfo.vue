<template>
    <div v-if="progressData && progressData.goal_name" class="progress-info-container">
        <div class="charts-container">
            <h1>Графіки</h1>
            <div class="BMR-BarChart">
                <BarChart :BMRData="BMRData"></BarChart>
                <h1>Базовий обмін речовин</h1>
            </div>
            <div class="BMI-BarChart">
                <LineChart :BMIData="BMIData"></LineChart>
                <h1>Індекс маси тіла</h1>
            </div>
        </div>
        <div class="user-interaction">
            <div class="user-progress-info-box">
                <h1>Поточні дані</h1>
                <div class="user-progress-info">
                    <div class="user-main-info-box">
                        <p>{{ progressData.goal_name?.toUpperCase() }}</p>
                        <div class="user-recomended-calories-box">
                            <p class="recomended-calories">{{ progressData.current_calories_goal }} ккал</p>
                            <p>Рекомендована добова норма калорій</p>
                        </div>
                    </div>
                    <div class="user-body-info-box">
                        <p>Базовий обмін речовин {{ progressData.progress_data?.[progressData.progress_data.length - 1]?.BMR }} ккал</p>
                        <p>Індекс маси тіла {{ progressData.progress_data?.[progressData.progress_data.length - 1]?.BMI }}</p>
                    </div>
                    <div class="user-metric-info">
                        <p>Ваша вага {{ progressData.progress_data?.[progressData.progress_data.length - 1]?.weight }} кг</p>
                        <p>Ваш зріст {{ progressData.progress_data?.[progressData.progress_data.length - 1]?.height }} см</p>
                    </div>
                </div>
            </div>
            <div class="user-progress-add-container">
                <h1>Додаваня нового прогресу</h1>
                <form class="user-progress-form">
                    <div class="input-data-progress">
                        <p>Вага</p>
                        <input type="number" placeholder="Введість нову вагу" v-model="dto.weight">
                    </div>
                    <div class="input-data-progress">
                        <p>Зріст</p>
                        <input type="number" placeholder="Введість новий зріст" v-model="dto.height">
                    </div>
                </form>
                <div class="user-progress-btn-box">
                    <button @click="addNewProgress" class="btn-add-progress">Додати новий прогрес</button>
                    <button @click="delLastProgress" class="btn-delete-last-progress">Видалити попередній прогрес</button>
                </div>
                <p class="err-text" v-show="err !==''"> {{ err }} </p>
            </div>
        </div>
    </div>
    <div v-else>
        <p>Loading...</p>
    </div>
</template>

<script>
    import BarChart from './chart/BarProgressChart.vue' 
    import LineChart from './chart/LineProgressChart.vue' 

    export default {
        name: 'ProgressInfo',
        props: {
            progressData: {
                type: Object,
                required: false,
                default: () => ({})  // Provide a default empty object
            },
            deleteLastProgress: {
                type: Function,
                required: false,
            },
            addProgress: {
                type: Function,
                required: false,
            },
        },
        data() {
            return {
                dto: {
                    weight: 0.0,
                    height: 0.0,
                },
                err: ""
            };
        },
        methods: {
            addNewProgress() {
                this.err = "";
                if(this.dto.weight < 22) {
                    this.err = "Занадто мала вага !";
                    return this.err;
                } else if(this.dto.weight > 400) {
                    this.err = "Занадто велика вага !";
                    return this.err;
                }
                if(this.dto.height < 120) {
                    this.err = "Занадто малий зріст !";
                    return this.err;
                } else if(this.dto.height > 220) {
                    this.err = "Занадто великий зріст !";
                    return this.err;
                }
                this.addProgress(this.dto);
            },
            delLastProgress() {
                console.log(this.progressData.progress_data.length);
                if(this.progressData.progress_data.length > 1) {
                    this.deleteLastProgress();
                }
            }
        },
        computed: {
            BMRData() {
                return this.progressData.progress_data?.map(data => data.BMR) || [];
            },
            BMIData() {
                return this.progressData.progress_data?.map(data => data.BMI) || [];
            }
        },
        components: {
            BarChart,
            LineChart
        }
    };
</script>


<style scoped>

    .progress-info-container {
        margin: 25px 0;
        display: flex;
        width: 100%;
        height: 100%;
        /* align-items: center; */
        justify-content: space-evenly;
        font-family: 'Open Sans';
        color: aliceblue;
    }

    .charts-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 700px;
        min-height: 562px;
    }

    .charts-container h1 {
        font-size: 30px;
    }

    .BMR-BarChart {
        width: 100%;
        height: 223px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .BMR-BarChart h1 { 
        font-size: 20px;
        color: #639064;
    }

    .BMI-BarChart {
        margin-top: 30px;
        width: 100%;
        height: 223px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .BMI-BarChart h1 {
        font-size: 20px;
        color: #639064;
    }

    .user-interaction {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 540px;
        min-height: 562px;
    }

    .user-progress-info-box {
        width: 100%;
        height: 260px;
        background: #1c1c1c;
        border-radius: 5px;
        box-shadow: 0px 2px 10px 1px #00000052;
        display: flex;
        align-items: center;
        flex-direction: column;
        padding: 5px;
    }

    .user-progress-info-box h1 {
        font-size: 30px;
        margin-top: 2px;
    }

    .user-progress-info {
        width: 100%;
        margin-top: 10px;
        /* height: 100%; */
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .user-main-info-box {
        display: flex;
        width: 90%;
        align-items: center;
        /* font-size: 17px; */
        justify-content: space-between;
        height: 95px;
        border-bottom: 1px solid aliceblue;
    }

    .user-main-info-box p {
        font-size: 23px;
    }

    .user-recomended-calories-box {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        width: 80%;
        text-align: center;
        margin-left: 15px;
        border-radius: 5px;
        padding: 5px;
        background: #2c2c2c;
    }

    .user-recomended-calories-box p {
        font-size: 17px;
    }

    .recomended-calories {
        /* font-size: 25px; */
        font-family: cursive;
        color: #639064;
    }

    .user-body-info-box {
        width: 90%;
        margin-top: 10px;
    }

    .user-metric-info {
        width: 90%;
    }

    .user-progress-add-container {
        width: 100%;
        margin-top: 5px;
        padding: 5px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .user-progress-add-container h1 {
        font-size: 30px;
    }

    .user-progress-form {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .input-data-progress {
        margin-top: 10px;
        width: 100%;
        display: flex;
        flex-direction: column;
    }

    
    .input-data-progress p {
        margin: 0px 0px 5px 10px;
    }

    .input-data-progress input {
        height: 38px;
        border-radius: 3px;
        background-color: aliceblue;
        width: 100%;
        padding-left: 5px;
        border: none;
    }

    .input-data-progress input:focus {
        outline: none;
        border: none;
    }

    .user-progress-btn-box {
        margin-top: 18px;
        display: flex;
        align-items: center;
        width: 100%;
        justify-content: space-between;
    }

    .btn-add-progress, .btn-delete-last-progress {
        padding: 10px;
        font-family: 'Open Sans';
        border-radius: 5px;
        width: 240px;
        background: #2c2c2c;
        border: none;
        color: aliceblue;
        transition: all 0.2s ease;
        cursor: pointer;
    }

    .btn-add-progress:hover {
        color: #2c2c2c;
        background-color: aliceblue;
        font-weight: bold;
    }

    .btn-delete-last-progress:hover {
        color: #2c2c2c;
        background-color: #d26363;
        font-weight: bold;
    }

    .err-text {
        text-align: center;
        color: #9f4a4a;
        font-size: 18px;
        margin-top: 5px;
    }

</style>
