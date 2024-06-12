<template>
    <div class="nutrition-info-container">
        <div class="pie-box">
            <PieCalcChart :protein="progress_data.proteins" :fats="progress_data.fats" :carbohydrates="progress_data.carbohydrates"></PieCalcChart>
        </div>
        <div class="calories-container">
            <div class="calories-header-box">
                <h2>{{ progress_data.goal_name.toUpperCase() }}</h2>
                <p>Рекомендоване добове споживання калорій: <p class="current_calories_goal_info">{{ progress_data.current_calories_goal }}</p></p>
            </div>
            <div class="calorios-box">
                <p>Протеїн: {{ progress_data.proteins }}</p>
                <p>Вуглеводи: {{ progress_data.carbohydrates }}</p>
                <p>Жири: {{ progress_data.fats }}</p>
            </div>
            <div class="mertics-box">
                <p>ІМТ: {{ progress_data.progress_data[progress_data.progress_data.length -1].BMI }}</p>
                <p>БОР: {{ progress_data.progress_data[progress_data.progress_data.length -1].BMR }}</p>
            </div>
            <div class="BMI-info-box">
                <p>У Вас {{ BMIResult(progress_data.progress_data[progress_data.progress_data.length -1].BMI) }}</p>
            </div>
        </div>
    </div>

    <div class="nutrition-container">
        <h1>{{ nutrition[0].day_nutrition }}</h1>
        <div v-for="(meals, mealsTime) in groupedNutrition" :key="mealsTime" class="meals-box">
            <h2>{{ mealsTime }}</h2>
            <div v-for="nutr in meals" :key="nutr.id" class="nutrition-box">
               <div class="meals-info-box">
                    <div class="nutrition-name-box">
                        <p>{{ nutr.name }}</p>
                    </div>
                    <div class="nutrition-info-box">
                        <p>Протеїн: {{ nutr.proteins }}</p>
                        <p>Жири: {{ nutr.fats }}</p>
                        <p>Вуглеводи: {{ nutr.carbohydrates }}</p>
                        <p>На яку вагу: {{ nutr.product_mass }} {{ nutr.measurement }}</p>
                    </div>
               </div>
               <div class="calories-box">
                    <p>{{ nutr.calories }} ккал</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import PieCalcChart from '@/views/progress/progress_subpage/chart/PieCalcChart.vue';

export default {
    name: 'TrainingPage',
    components: {
        PieCalcChart
    },
    props: {
        progress_data: {
            type: Object,
            required: false,
            default: () => ({})  // Provide a default empty object
        },
        nutrition: {
            type: Array,
            required: false,
            default: () => ([])  
        }
    },
    methods: {
        BMIResult(BMI) {
            if(BMI<16 ) { return "сильна недовага"} 
            else if(BMI >= 16 && BMI < 18.5) { return "недовага" }
            else if(18.5 && BMI < 24.99) { return "нормальна вага" }
            else if(BMI >= 25 && BMI < 29.99) { return "надлишкова вага" }
            else if(BMI >= 30) { return "сильна надлишкова вага" }
        }
    },
    computed: {
        groupedNutrition() {
            return this.nutrition.reduce((acc, nutr) => {
                if (!acc[nutr.meals_time]) {
                    acc[nutr.meals_time] = [];
                }
                acc[nutr.meals_time].push(nutr);
                return acc;
            }, {});
        }
    },
}
</script>

<style scoped>

.nutrition-info-container {
    position: relative;
    width: 75%;
    display: flex;
    /* justify-content: space-evenly; */
    /* justify-content: space-evenly; */
    align-items: center;
    /* background-color: #232323; */
    border-radius: 3px;
    padding: 10px;
    margin-top: 15px;
    justify-content: center;
    border-top: 1px solid aliceblue;
}

.calories-container {
    width: 420px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.calories-header-box {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.calories-header-box h2 {
    text-align: center;
    /* height: 30px; */
    width: 100%;
    border-bottom: 1px solid aliceblue;
    /* padding-bottom: 5px; */
    font-size: 21px;
    margin-bottom: 10px;
    padding-bottom: 5px;
}

.calories-header-box p {
    display: flex; 
}

.current_calories_goal_info {
    color: #639064;
    font-weight: bold;
    margin-left: 5px;
}

.calorios-box {
    width: 100%;
    display: flex;
    justify-content: space-around;
    margin-top: 5px;
}

.mertics-box {
    margin-top: 15px;
    width: 100%;
    display: flex;
    font-size: 20px;
    justify-content: space-evenly;
}

.BMI-info-box {
    display: flex;
    width: 100%;
    color: #a7a363;
    font-weight: bold;
    margin-top: 10px;
    font-size: 20px;
    justify-content: center;
}

.nutrition-user-progress-container {
    margin-top: 30px;
    width: 85%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.nutrition-container {
    width: 1095px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.nutrition-container h1 {
    /* margin-bottom: 10px; */
    margin-top: 10px;
}

.meals-box {
    margin-top: 10px;
    display: flex;
    flex-direction: column;
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid aliceblue;
}

.meals-box h2 {
    margin-left: 10px;
    /* font-size: 20px; */
    color: #639064;
}

.nutrition-box {
    display: flex;
    align-items: center;
    justify-content: space-around;
    position: relative;
    width: 100%;
    border-radius: 5px;
    height: 150px;
    margin: 5px 0px;
    /* background: aliceblue; */
    background-color: #232323;;
}

.meals-info-box {
    display: flex;
    align-items: center;
    justify-content: center;
}

.nutrition-name-box {
    color: aliceblue;
    font-weight: bold;
    height: 60%;
    font-size: 25px;
    display: flex;
    align-items: center;
    text-align: center;
    width: 420px;
    justify-content: center;
    border-bottom: 1px solid aliceblue;
}

.nutrition-info-box {
    margin-left: 40px;
    font-weight: bold;
    height: 60%;
    /* font-size: 28px; */
    display: flex;
    align-items: flex-start;
    width: 300px;
    justify-content: space-between;
    flex-direction: column;
}

.nutrition-info-box h2 {
    font-size: 30px;
    padding-bottom: 5px;
    border-bottom: 2px solid aliceblue;
}

.calories-box {
    font-size: 20px;
    color: #639064;
}

</style>