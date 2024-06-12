<template>
    <div class="calculation-container">
        <form class="calculation-form-container" >
            <h2>Калькулятор калорій</h2>
            <div class="inputs-box">
                <div class="calcutaion-radio-box">
                    <div class="btn-choose-sex">
                        <input type="radio" id="female" name="sex" value="жінка" v-model="sex">
                        <label for="female">Жінка</label>
                    </div>
                    <div class="btn-choose-sex">
                        <input type="radio" id="male" name="sex" value="чоловік" v-model="sex">
                        <label for="male">Чоловік</label>
                    </div>
                </div>
                <div class="calculation-range-box">
                    <div class="calculation-range-info">
                        <p>Зріст</p>
                        <div class="range-info-box">
                            <p> {{ height }} </p>
                        </div>
                    </div>
                    <input min="0" max="220" v-model="height" type="range">
                </div>
                <div class="calculation-range-box">
                    <div class="calculation-range-info">
                        <p>Вік</p>
                        <div class="range-info-box">
                            <p> {{ age }} </p>
                        </div>
                    </div>
                    <input min="0" max="120" v-model="age" type="range">
                </div>
                <div class="calculation-range-box">
                    <div class="calculation-range-info">
                        <p>Вага</p>
                        <div class="range-info-box">
                            <p> {{ weight }} </p>
                        </div>
                    </div>
                    <input min="0" max="150" v-model="weight" type="range">
                </div>
                <div class="calculation-select-box">
                    <label>Оберіть свій фізичний рівень активності:</label>
                    <select id="activity" name="activity" v-model="activity">
                        <option value="легка">Легка</option>
                        <option value="середня">Середня</option>
                        <option value="висока">Висока</option>
                    </select>
                </div>
                <div class="calcutaion-purpose-radio-box">
                   <p>Оберіть свою ціль</p>
                   <div class="btn-box-choose-purpose">
                        <div class="btn-choose-purpose">
                            <input id="lose-weight" type="radio"name="purpose" value="схуднути" v-model="purpose">
                            <label for="lose-weight">Схуднути</label>
                        </div>
                        <div class="btn-choose-purpose">
                            <input id="muscle-mass" type="radio" name="purpose" value="набір м'язової маси" v-model="purpose">
                            <label for="muscle-mass">Набір м'язової маси</label>
                        </div>
                        <div class="btn-choose-purpose">
                            <input id="shape" type="radio" name="purpose" value="бути у формі" v-model="purpose">
                            <label for="shape">Бути у формі</label>
                        </div>
                   </div>
                </div>
                <div class="calculation-range-box">
                    <div class="calculation-range-info">
                        <p>Тип тіла</p>
                    </div>
                    <input min="1" max="3" v-model.number="body_type" type="range">
                    <div class="body-type-box">
                        <div class="body-type-name-box" :class="{'body-type-active':body_type === 1}">
                            <p>Ектоморф</p>
                        </div>
                        <div class="body-type-name-box" :class="{'body-type-active':body_type === 2}">
                            <p>Мезоморф</p>
                        </div>
                        <div class="body-type-name-box" :class="{'body-type-active':body_type === 3}">
                            <p>Ендоморф</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <button class="btn-result">Розрахувати</button> -->
        </form>
        <div class="result-container">
            <h2>Ваші результати</h2>
            <div class="result-content">
                <div class="chart-container">
                    <h1>Рекомендована добова норма калорій</h1>
                    <div class="chart-box">
                        <PieChart :protein="protein" :fats="fats" :carbohydrates="carbohydrates"></PieChart>
                        <p> {{ calories }} ккал</p>
                    </div>
                    <div class="calories-container">
                        <p>Протеїн: {{ protein }}</p>
                        <p>Жири: {{ fats }}</p>
                        <p>Вуглеводи: {{ carbohydrates }}</p>
                    </div>
                </div>
                <div class="body-result">
                    <div class="BMR-box">
                        <h1>Базовий обмін речовин</h1>
                        <p>{{ BMR }} ккал</p>
                    </div>
                    <div class="BMI-box">
                        <h1>Індекс маси тіла</h1>
                        <p>{{ BMI }}</p>
                        <div class="BMI-result-box">
                            <div class="BMI-result" :class="{'BMI-result-red':BMI<16}"></div>
                            <div class="BMI-result" :class="{'BMI-result-yellow':BMI >= 16 && BMI < 18.5}"></div>
                            <div class="BMI-result" :class="{'BMI-result-green':BMI >= 18.5 && BMI < 24.99}"></div>
                            <div class="BMI-result" :class="{'BMI-result-yellow':BMI >= 25 && BMI < 29.99}"></div>
                            <div class="BMI-result" :class="{'BMI-result-red':BMI >= 30}"></div>
                        </div>
                        <p class="BRM-err">{{ BMI_err }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import PieChart from './chart/PieCalcChart.vue'

    export default {
        name: 'Calculation',
        data() {
            return {
                sex: "жінка", 
                height: 175.0, 
                weight: 65.0, 
                age: 17,
                activity: "легка",
                body_type: 1,
                purpose: "схуднути",
                protein: 0,
                fats: 0,
                carbohydrates: 0,
                calories: 0,
                BMR: 0.0,
                BMI: 0.0,
                BMI_err: ""
            };
        },
        methods: {
            findBMR() {
                if(this.sex == "чоловік") {
                    const BMR = (9.99 * this.weight) + (6.25 * this.height) - (4.92 * this.age) + 5;
                    this.BMR = Math.floor( BMR * 100 ) / 100;
                } else if (this.sex == "жінка") {
                    const BMR = (9.99 * this.weight) + (6.25 * this.height) - (4.92 * this.age) - 161;;
                    this.BMR = Math.floor( BMR * 100 ) / 100;
                }
            },
            findBMI() {
                const height_m = this.height * 0.01;
                const BMI = Math.floor( (this.weight / (height_m * height_m)) * 100 ) / 100;
                if (BMI < 16) {
                    this.BMI_err = "Надмірний дефіцит маси тіла";
                } else if (BMI >= 16 && BMI < 18.5) {
                    this.BMI_err = "Дефіцит маси тіла";
                } else if (BMI >= 18.5 && BMI < 24.99) {
                    this.BMI_err = "Нормальна вага";
                } else if (BMI >= 25 && BMI < 29.99) {
                    this.BMI_err = "Надлишкова вага";
                } else if (BMI >= 30) {
                    this.BMI_err = "Ожиріння";
                };
                this.BMI = BMI;
            },
            calculateRecomendedCalories() {
                this.findBMR();
            
                // Коефіцієнти активності та типу тіла
                const activity_coefficient = {
                    "легка": 1.25,
                    "середня": 1.55,
                    "висока": 1.725
                }[this.activity] || 1;
            
                const body_type_coefficient = {
                    1: 1.2,
                    2: 1.0,
                    3: 1.0
                }[this.body_type] || 1;
            
                // Коефіцієнти для різних типів тренувань
                const training_coefficient = {
                    "набір м'язової маси": { calories_factor: 1.10, proteins: 25, carbohydrates: 49, fats: 26 },
                    "схуднути": { calories_factor: 0.85, proteins: 28, carbohydrates: 43, fats: 29  },
                    "бути у формі": { calories_factor: 1.0, proteins: 25, carbohydrates: 47, fats: 28  }
                };
            
                const formula = training_coefficient[this.purpose] || { calories_factor: 1.0, proteins: 25, carbohydrates: 47, fats: 28  };
            
                // Розрахунок калорій
                this.calories = Math.floor( (this.BMR * formula.calories_factor * activity_coefficient * body_type_coefficient) * 100 ) / 100;
            
                // Розрахунок макроелементів
                this.protein = Math.floor( ((formula.proteins / 100) * this.calories / 4) * 100 ) / 100; // 4 - кількість калорій у 1 г білка
                this.carbohydrates = Math.floor( ((formula.carbohydrates / 100) * this.calories / 4) * 100 ) / 100;; // 4 - кількість калорій у 1 г вуглеводів
                this.fats = Math.floor( ((formula.fats / 100) * this.calories / 9) * 100 ) / 100; // 9 - кількість калорій у 1 г жиру
            },
            calculateCalories() {
                this.calculateRecomendedCalories();
                this.findBMI();
            },
        },
        components: {
            PieChart
        },
        watch: {
            sex: { handler() { this.calculateCalories(); } },
            height: { handler() { this.calculateCalories(); } },
            weight: { handler() { this.calculateCalories(); } },
            age: { handler() { this.calculateCalories(); } },
            activity: { handler() { this.calculateCalories(); } },
            body_type: { handler() { this.calculateCalories(); } },
            purpose: { handler() { this.calculateCalories(); } }
        },
        mounted() {
            this.calculateCalories();
        }
    }
</script>

<style scoped>

    .calculation-container {
        margin: 25px 0;
        display: flex;
        height: 100%;
        align-items: center;
        justify-content: space-evenly;
        width: 100%;
        color: #b8c3cc;
        font-family: 'Open Sans';
    }

    .calculation-form-container {
        width: 600px;
        height: 608px;
        background: #1c1c1c;
        border-radius: 5px;
        box-shadow: 0px 2px 10px 1px #00000052;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 5px;
    }

    .calculation-form-container h2 {
        margin: 10px 0px;
        /* margin-top: 10px; */
        text-align: center;
        width: 85%;
        height: 40px;
        border-bottom: 1px solid #b8c3cc;
    }

    .inputs-box {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .calcutaion-radio-box {
        border-radius: 5px;
        background: #2c2c2c;
        display: flex;
        justify-content: center;
        margin: 5px 0px;
    }

    .btn-choose-sex {
        width: 200px;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 50px;
        position: relative;
    }

    .btn-choose-sex label {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 5px;
        transition: all 0.1s ease-out;
        font-weight: bold;
        cursor: pointer;
    }

    .btn-choose-sex input[type="radio"] {
        opacity: 0;
        width: 0;
        height: 0;
        position: absolute;
    }

    .btn-choose-sex input[type="radio"]:checked + label {
        /* background-color: #597797; */
        background-color: aliceblue;
        color: rgb(19, 19, 19);
    }

    .calculation-range-box {
        margin: 5px 0px 8px 0px;
        /* width: 100%; */
        width: 400px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    .calculation-range-info {
        /* width: 330px; */
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .range-info-box {
        width: 85px;
        height: 28px;
        border: 1px solid #b8c3cc;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 5px;
    }

    .calculation-range-box input[type='range'] {
        /* overflow: hidden; */
        margin-top: 8px;
        width: 100%;
        -webkit-appearance: none;
        background-color: #2c2c2c;
        border-radius: 3px;
        height: 10px;
    }

    .calculation-range-box input[type='range']::-webkit-slider-runnable-track {
        height: 10px;
        -webkit-appearance: none;
        margin-top: 0; /* Виправлено значення */
        border-radius: 3px; /* Зменшено border-radius для треку */
        cursor: pointer;
    }
    
    .calculation-range-box input[type='range']::-webkit-slider-thumb {
      width: 17px;
      height: 17px;
      -webkit-appearance: none;
      background: aliceblue;
      border-radius: 50%;
      margin-top: -3px;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .calculation-range-box input[type='range']::-webkit-slider-thumb:active {
        background: #639064;
    }

    .calculation-select-box {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 400px;
        margin: 5px 0px 2px 0px;
        height: 95px;
        border-bottom: 1px solid #b8c3cc;
    }

    .calculation-select-box label {
        font-size: 18px;
        margin-bottom: 13px;
    }

    .calculation-select-box select {
        width: 358px;
        background: #2c2c2c;
        border-radius: 3px;
        height: 35px;
        border: 1px solid #b8c3cc;
        color: #b8c3cc;
        cursor: pointer;
        text-align: center;
        font-size: 17px;
    }

    .calculation-select-box select:focus {
        border: 1px solid #b8c3cc;
        outline: none; /* Прибирає стандартний outline */
    }

    .calculation-select-box option {
        background: #2c2c2c;
    }

    .calcutaion-purpose-radio-box {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        margin: 5px 0px;
    }

    .calcutaion-purpose-radio-box p {
        font-size: 18px;
        margin-bottom: 7px
    }

    .btn-box-choose-purpose {
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 5px;
        background: #2c2c2c;
    }

    .btn-choose-purpose {
        width: 180px;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 50px;
        position: relative;
    }

    .btn-choose-purpose label {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 5px;
        transition: all 0.1s ease-out;
        font-weight: bold;
        cursor: pointer;
    }

    .btn-choose-purpose input[type="radio"] {
        opacity: 0;
        width: 0;
        height: 0;
        position: absolute;
    }

    .btn-choose-purpose input[type="radio"]:checked + label {
        /* background-color: #597797; */
        background-color: aliceblue;
        color: rgb(19, 19, 19);
    }


    .body-type-box {
        margin-bottom: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
    }

    .body-type-name-box {
        margin: 5px 10px;
    }

    .body-type-active {
        color: #639064;
    }

    .result-container {
        /* height: 100%; */
        /* height: 601.4px; */
        height: 608px;
        width: 500px;
        background: #1c1c1c;
        border-radius: 5px;
        box-shadow: 0px 2px 10px 1px #00000052;
        display: flex;
        flex-direction: column;
        align-items: center;
        /* align-items: center; */
        /* justify-content: center; */
        padding: 5px;
    }

    .result-container h2 {
        margin: 10px 0px;
        /* margin-top: 10px; */
        text-align: center;
        width: 85%;
        height: 40px;
        border-bottom: 1px solid #b8c3cc;
    }  

    .result-content {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .chart-container {
        width: 100%;
        height: 340px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .chart-container h1 {
        font-size: 18px;
        margin-bottom: 10px
    }

    .chart-container p {
        margin-top: 15px;
        font-size: 22px;
        font-weight: bold;
    }

    .chart-box {
        height: 100%;
        width: 100%;
        display: flex;
        flex-direction: column;
        /* justify-content: center; */
        align-items: center;
    }

    .calories-container {
        width: 90%;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        border-bottom: #b8c3cc 1px solid;
        height: 50px;
    }

    .calories-container p {
       font-size: 16px;
       margin-top: 5px
    }

    .body-result {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
    }

    .BMR-box {
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .BMR-box h1 { 
        font-size: 23px;
    }

    .BMR-box p { 
        font-size: 22px;
    }   

    .BMI-box {
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
    }

    .BMI-box h1 {
        font-size: 23px;
    }

    .BMI-box p { 
        font-size: 22px;
    }  

    .BMI-result-box {
        width: 100%;
        display: flex;
        justify-content: center;
    }

    .BMI-result {
        width: 40px;
        height: 15px;
        margin: 5px 5px;
        background: #2c2c2c;
        border-radius: 5px;
    }

    .BMI-result-green {
        background: #639064;
    }

    .BMI-result-yellow {
        background: #908663;
    }

    .BMI-result-red {
        background: #8b4646;
    }

    .BRM-err {
        width: 100%;
        text-align: center;
    }

</style>