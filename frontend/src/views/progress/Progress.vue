<template>
    <Header></Header>
    <Notes v-show="token"></Notes>
    <main class="progress-container">
        <p class="empty-text" v-if="!isLoading && !canGetProgress"> Схоже, Ви не зареєструвалися або не обрали тип тренування :( </p>
        <div class="page-info-container" v-else-if="canGetProgress && !isLoading">
            <div class="page-info-btn-box">
                <button @click="openProgressInfo" class="page-info-btn" :class="{'active-info-btn': progressInfo}">Дані прогресу</button>
                <button @click="openCalculation" class="page-info-btn" :class="{'active-info-btn': !progressInfo}">Калькулятори</button>
            </div>
            <ProgressInfoPage v-if="progressInfo" 
            :progressData="progressData"
            :deleteLastProgress="deleteLastProgress"
            :addProgress="addProgress"
            ></ProgressInfoPage>
            <CalculationPage v-else></CalculationPage>
        </div>
    </main>
    <Footer></Footer>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import Header from "../../components/header/Header.vue";
import Footer from "../../components/footer/Footer.vue";
import Notes from "../../components/note/Note.vue"
import ProgressInfoPage from "./progress_subpage/ProgressInfo.vue";
import CalculationPage from "./progress_subpage/Calculation.vue";

export default {
    name: 'ProgressPage',
    data() {
        return {
            progressData: {},
            canGetProgress: false,
            progressInfo: true,
            isLoading: true,
            token: false
        };
    },
    computed: {
        ...mapGetters(["getDeleteLastProgress", "getProgressData", "getAddProgressData", "getSelectType"]),
    },
    methods: {
        ...mapActions(["deleteProgress", "getProgress", "postAddProgress", "getUserType"]),
        openProgressInfo() {
            this.progressInfo = true;
        },
        openCalculation() {
            this.progressInfo = false;
        },
        async getProgressInfo() {
            await this.getUserType();
            const selectType = this.getSelectType;
            if (selectType) {
                this.canGetProgress = true;
                await this.getProgress();
                const progress = this.getProgressData;
                this.progressData = progress;
                this.isLoading = false;
            } else {
                this.canGetProgress = false;
                this.isLoading = false;
            }
        },
        async deleteLastProgress() {
            await this.deleteProgress();
            if (this.getDeleteLastProgress) {
                await this.getProgress();
                this.progressData = this.getProgressData;
            }
        },
        async addProgress(dto) {
            await this.postAddProgress(dto);
            if (this.getAddProgressData) {
                await this.getProgress();
                this.progressData = this.getProgressData;
            }
        }
    },
    components: {
        Header,
        Footer,
        ProgressInfoPage,
        CalculationPage,
        Notes
    },
    mounted() {
        if (sessionStorage.getItem("token")) {
            this.token = true;
            this.getProgressInfo();
        } else {
            this.token = false;
            this.canGetProgress = false;
            this.isLoading = false;
        }
    }
};
</script>

<style scoped>
    .progress-container {
        width: 100%;
        min-height: calc(101vh - 3.325rem - 45px);
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
    }

    .empty-text {
        position: absolute;
        top: 30%;
        font-family: 'Open Sans';
        font-size: 20px;
        color: #b8c3cc;
    }

    .page-info-container {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }

    .page-info-btn-box {
        /* width: 72%; */
        /* width: 30%; */
        width: 462px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        height: 50px;
        margin-top: 10px;
    }

    .page-info-btn {
        /* height: 90%; */
        height: 42px;
        /* margin: 10px; */
        background-color: rgb(19, 19, 19);
        color: #b8c3cc;
        width: 160px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.3s ease;
        font-family: 'Open Sans';
        font-size: 15px;
        border: 1px solid #b8c3cc;
    }
    
    .page-info-btn:hover {
        background-color: aliceblue;
        color: rgb(19, 19, 19);
        font-size: 16px;
        /* font-weight: 600; */
    }

    .active-info-btn {
        background-color: aliceblue;
        color: rgb(19, 19, 19);
    }
    /* <p class="empty-text" v-if="!token"> Схоже, Ви не зареєструвалися :( </p>
        <div class="page-info-container" v-else>
            <div class="page-info-btn-box">
                <button class="page-info-btn" :class="{'active-info-btn':progressInfo }">Дані прогресу</button>
                <button class="page-info-btn" :class="{'active-info-btn':!progressInfo }">Калькулятори</button>
            </div> */
</style>
