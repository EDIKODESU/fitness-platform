<template>
    <Header></Header>
    <Notes v-show="token"></Notes>
    <main class="training-container">
        <p class="no-type-register" v-if="!is_loading && !can_getData"> Схоже, Ви не зареєструвалися або не обрали тип тренування :( </p>
        <div class="training-info-container" v-else-if="!is_loading && can_getData">
            <div class="btn-choose-container">
                <button class="btn-choose" :class="{'active-bth-choose':subpage == 'дім'}" @click="toHomeExercisesSubpage">
                    <p>Тренування вдома</p>
                </button>
                <button class="btn-choose" :class="{'active-bth-choose':subpage == 'спортзал'}" @click="toSportExercisesSubpage">
                <p>Тренування у спортзалі</p>
                </button>
                <button class="btn-choose" :class="{'active-bth-choose':subpage == 'харчування'}" @click="toNutritionSubpage">
                    <p>Харчування</p>
                </button>
            </div>
            <div class="training-box">
                <p v-if="(subpage == 'дім' && !have_exercises_home) || (subpage == 'спортзал' && !have_exercises_gym)">У вас сьогодні немає тренувань, тому можете відпочивати</p>
                <Exercises v-if="subpage == 'дім' && have_exercises_home" 
                    :workouts="homeWorkouts"
                    :img_path="'../../../../public/training/homeworkout.png'">
                </Exercises>
                <Exercises v-else-if="subpage == 'спортзал' && have_exercises_gym" 
                :workouts="gymWorkouts"
                :img_path="'../../../../public/training/gymworkout.png'"></Exercises>
                <Nutrition v-else-if="subpage == 'харчування'" :nutrition="nutrition" :progress_data="progress_data"></Nutrition>
            </div>
        </div>
    </main>
    <Footer></Footer>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import Header from "../../components/header/Header.vue";
import Footer from "../../components/footer/Footer.vue";
import Exercises from "./training_subpage/Exercises.vue";
import Nutrition from "./training_subpage/Nutrition.vue";
import Notes from "../../components/note/Note.vue"
// import router from '../../router';

export default {
    name: 'TrainingPage',
    data() {
        return {
            homeWorkouts: [],
            gymWorkouts: [],
            nutrition: [],
            progress_data: {},
            subpage: "дім",
            is_loading: true,
            can_getData: false,
            have_exercises_home: false,
            have_exercises_gym: false,
            token: false
        };
    },
    computed: {
        ...mapGetters(["getExercises", "getNutrations", "getProgressData", "getSelectType"]),
    },
    methods: {
        ...mapActions(["getExerciseData", "getNutrationData", "getProgress", "getUserType"]),
        toHomeExercisesSubpage() {
            this.subpage = "дім";
        },
        toSportExercisesSubpage() {
            this.subpage = "спортзал";
        },
        toNutritionSubpage() {
            this.subpage = "харчування";
        },
        async getUserProgress() {
            await this.getProgress();
            const progress = this.getProgressData;
            if(Object.keys(progress).length > 0) {
                this.progress_data = progress;
            }
            this.progressData = progress;
        },
        async getUserNutrations() {
            await this.getNutrationData();
            const user_nutration = this.getNutrations;
            if(user_nutration.length > 0) {
                this.nutrition = user_nutration;
                await this.getUserProgress();
            } else {
                console.log("err nutration", user_nutration);
            }
        },
        async getUserExercises() {
            await this.getExerciseData();
            const user_exercises = this.getExercises;
            if(user_exercises.length > 0) {
                const { homeWorkouts, gymWorkouts } = user_exercises.reduce((acc, item) => {
                    if (item.type === 'дім') {
                        acc.homeWorkouts.push(item);
                    } else if (item.type === 'спортзал') {
                        acc.gymWorkouts.push(item);
                    }
                    return acc;
                }, { homeWorkouts: [], gymWorkouts: [] });
                if(homeWorkouts.length > 0) {
                    this.homeWorkouts = homeWorkouts;
                    this.have_exercises_home = true;
                }
                if(gymWorkouts.length > 0) {
                    this.gymWorkouts = gymWorkouts;
                    this.have_exercises_gym = true;
                }
            } else {
                console.log("err user_exercises:", user_exercises);
                this.have_exercises = false;
            }
        },
        async getAccessData() {
            await this.getUserType();
            const selectType = this.getSelectType;
            if (selectType) {
                this.can_getData = true;
                await this.getUserExercises();
                await this.getUserNutrations();
            } else {
                this.can_getData = false;
            }
            this.is_loading = false;
        },
    },
    components: {
        Header,
        Footer,
        Exercises,
        Nutrition,
        Notes
    },
    mounted() {
        if (sessionStorage.getItem("token")) {
            this.token = true;
            this.getAccessData();
        } else {
            this.token = false;
            this.can_getData = false;
            this.is_loading = false;
        }
    }
};
</script>

<style scoped>
    .training-container {
        color: aliceblue;
        font-family: 'Open Sans';
        width: 100%;
        min-height: calc(101vh - 3.325rem - 45px);
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
    }

    .no-type-register {
        position: absolute;
        top: 30%;
        font-family: 'Open Sans';
        font-size: 20px;
        color: #b8c3cc;
    }

    .training-info-container {
        height: 100%;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 25px;
    }

    .btn-choose-container {
        width: 642px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #232323;;
        border-radius: 3px;
    }

    .btn-choose {
        width: 100%;
        border: none;
        height: 50px;
        border-radius: 3px;
        background-color: #232323;;
        transition: all 0.2s ease;
        cursor: pointer;
    }

    .btn-choose p {
        color: aliceblue;
        font-family: 'Open Sans';
        font-size: 16px;
        transition: all 0.22s ease;
    }

    .btn-choose:hover {
        /* scale: 0.8; */
        width: 120%;
        background: aliceblue;
    }

    .btn-choose:hover p {
        scale: 0.9;
        color: #232323;
        font-weight: bold;
    }

    .active-bth-choose {
        background: aliceblue;
    }

    .active-bth-choose p {
        color: #232323;
        font-weight: bold;
    }

    .training-box {
        margin-top: 15px;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        flex-direction: column;
    }

</style>

