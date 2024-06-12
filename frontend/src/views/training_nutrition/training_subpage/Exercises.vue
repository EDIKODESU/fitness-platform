<template>
    <div class="exersices-container">
        <h1>День тренування: {{ workouts[0].training_day }}</h1>
        <div v-for="exercise in workouts" class="exersices-box">
            <div class="exersices-info-content">
                <div class="exersices-name-box">
                    <p>{{ exercise.name  }}</p>
                </div>
                <div class="exersices-info-box">
                    <p>Група м'язів: {{ exercise.muscle_groups_trained }}</p>
                    <p>Кількість повторень: {{ exercise.number_of_repetitions }} {{ exercise.measurement }}</p>
                    <p>Кількість підходів: {{ exercise.number_of_approaches }}</p>
                </div>
            </div>
            <div class="description-box">
                <p class="description_workput">{{ exercise.description }}</p>
                <p class="cal-met-info">{{ exercise.calories.toFixed(3) }} кал</p>
                <img class="img_workout" :src="img_path" alt="workout">
            </div>
        </div> 
    </div>
</template>

<script>
export default {
    name: 'ExercisesSubpage',
    props: {
        workouts: {
            type: Array,
            required: false,
            default: () => ([])  
        },
        img_path: {
            type: String,
            required: false,
            default: () => {""}
        }
    }
};
</script>

<style scoped>
    .exersices-container {
        width: 1095px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .exersices-container h1 {
        margin-bottom: 10px;
    }
    
    .exersices-box {
        display: flex;
        align-items: center;
        justify-content: space-around;
        position: relative;
        width: 100%;
        border-radius: 5px;
        height: 150px;
        margin: 5px 0px;
        background-color: #232323;;
        overflow: hidden;
    }

    .exersices-info-content {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .exersices-name-box {
        color: aliceblue;
        font-weight: bold;
        height: 60%;
        font-size: 23px;
        display: flex;
        align-items: center;
        text-align: center;
        width: 430px;
        justify-content: center;
        border-bottom: 1px solid aliceblue;
    }

    .exersices-info-box {
        font-weight: bold;
        height: 60%;
        /* font-size: 28px; */
        display: flex;
        align-items: center;
        width: 530px;
        justify-content: center;
        flex-direction: column;
        text-align: center;
    }

    .description-box {
        display: flex;
        width: 100%;
        position: relative;
        height: 100%;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    
    .description-box::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        filter: blur(6px);
        transition: box-shadow 0.2s ease;
    }

    .description-box:hover::after {
        box-shadow: inset 0px 0px 400px 300px #00000045;
    }

    .description_workput {
        position: absolute;
        top: 60%;
        left: 50%;
        opacity: 0;
        z-index: 1;
        transition: all 0.4s ease;
        transform: translate(320px, -50%);
        font-size: 18px;
        width: 90%;
    }

    .description-box:hover .description_workput {
        transform: translate(-50%, -50%);
        opacity: 1;
    }
    
    .img_workout {
        width: 100%;
        height: 100%;
        transform: translateX(320px) scale(1.1);
        filter: blur(1px);
        object-fit: cover;
        transition: all 0.55s ease;
    }

    
    .description-box:hover .img_workout {
        filter: blur(3px);
        transform: translateX(0) scale(1);
    }

    .cal-met-info {
        /* color: #639064; */
        font-weight: bold;
        position: absolute;
        transform: translateX(320px);
        top: 10px;
        left: 10px;
        opacity: 0;
        z-index: 1;
        transition: all 0.31s ease;
    }

    .description-box:hover .cal-met-info {
        transform: translateX(0px);
        opacity: 1;
    }
</style>