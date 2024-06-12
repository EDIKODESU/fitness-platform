<template>
    <Header></Header>
    <Notes v-show="token"></Notes>
    <main class="home-container">
        <div class="slider-container">
            <div class="slider-box" :style="{ transform: `translateX(-${currentIndex * 100}%)` }">
                <div class="slide">
                    <img class="slide-img" src="../../../public/slider/slider_1.png" alt="slider_1">
                </div>
                <div class="slide">
                    <img class="slide-img" src="../../../public/slider/slider_2.png" alt="slider_2">
                </div>
                <div class="slide">
                    <img class="slide-img" src="../../../public/slider/slider_3.png" alt="slider_3">
                </div>
                <div class="slide">
                    <img class="slide-img" src="../../../public/slider/slider_4.png" alt="slider_4">
                </div>
                <div class="slide">
                    <img class="slide-img" src="../../../public/slider/slider_5.png" alt="slider_5">
                </div>
            </div>
            <div class="slider-points">
                <div class="slide-point" :class="{ active: currentIndex === 0 }" @click="goToSlide(0)"></div>
                <div class="slide-point" :class="{ active: currentIndex === 1 }" @click="goToSlide(1)"></div>
                <div class="slide-point" :class="{ active: currentIndex === 2 }" @click="goToSlide(2)"></div>
                <div class="slide-point" :class="{ active: currentIndex === 3 }" @click="goToSlide(3)"></div>
                <div class="slide-point" :class="{ active: currentIndex === 4 }" @click="goToSlide(4)"></div>
            </div>
        </div>
        <div class="training-info-container" v-if="Object.keys(userTrainingType).length < 1">
            <div class="training-info-box">
                <div class="type-header">
                    <h2>Типи тренування</h2>
                    <div class="switch-training-slider">
                        <p @click="switchSwipeLeft($refs.trainingSlider)" class="switch-training">&#8249;</p>
                        <p @click="switchSwipeRight($refs.trainingSlider)" class="switch-training">&#8250;</p>
                    </div> 
                </div>
                <div class="training-slider-container" ref="trainingSlider">
                    <div class="training-slider-box">
                        <div class="training-card" @click="selectTrainingType(trainingType.type)" v-for="(trainingType, index) in trainingTypes" :key="index">
                            <img class="training-type-img" :src="'../../../public' + trainingType.image_link" :alt="index">
                            <p class="training-card-type">{{ trainingType.type.toUpperCase() }}</p>
                            <p class="training-card-description">{{ trainingType.description.toUpperCase() }}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="training-info-box" v-if="Object.keys(recomendedTrainingType).length > 0 && Object.keys(popularTrainingType).length > 0">
                <div class="type-header">
                    <h2>Рекомендовані та популярні тренування</h2>
                    <div class="switch-training-slider">
                        <p @click="switchSwipeLeft($refs.popularRecomemdedTrainingSlider)" class="switch-training">&#8249;</p>
                        <p @click="switchSwipeRight($refs.popularRecomemdedTrainingSlider)" class="switch-training">&#8250;</p>
                    </div> 
                </div>
                <div class="popular-recomended-training-container" ref="popularRecomemdedTrainingSlider">
                    <div class="popular-recomended-training-box">
                        <div class="popular-recomended-training-card" @click="selectTrainingType(recomendedTrainingType.type)">
                            <p class="popular-recomended-label" >Рекомендовані тренування</p>
                            <p class="popular-recomended-type" >{{ recomendedTrainingType.type.toUpperCase() }}</p>
                            <p class="popular-recomemded-description">{{ recomendedTrainingType.description.toUpperCase() }}</p>
                            <img class="training-type-img" :src="'../../../public' + recomendedTrainingType.image_link" :alt="recomendedTrainingType.type">
                        </div>
                        <div class="popular-recomended-training-card" @click="selectTrainingType(popularTrainingType.type)">
                            <p class="popular-recomended-label" >Популярне серед користувачів</p>
                            <p class="popular-recomended-type" >{{ popularTrainingType.type.toUpperCase() }}</p>
                            <p class="popular-recomemded-description">{{ popularTrainingType.description.toUpperCase() }}</p>
                            <img class="training-type-img" :src="'../../../public' + popularTrainingType.image_link" :alt="recomendedTrainingType.type">
                        </div>
                    </div>
                </div>
            </div>
            <div class="training-info-box" v-else-if="Object.keys(recomendedTrainingType).length > 0 && Object.keys(popularTrainingType).length < 1">
                <div class="type-header">
                    <h2>Рекомендоване тренування</h2>
                </div>
                <div class="recomended-training-container">
                    <div class="recomended-training-card" @click="selectTrainingType(recomendedTrainingType.type)">
                        <p class="recomemded-type">{{ recomendedTrainingType.type.toUpperCase() }}</p>
                        <p class="recomemded-description">{{ recomendedTrainingType.description.toUpperCase() }}</p>
                        <img class="training-type-img" :src="'../../../public' + recomendedTrainingType.image_link" :alt="recomendedTrainingType.type">
                    </div>
                </div>
            </div>
        </div>
        <div class="training-info-container" v-else>
            <div class="training-info-box">
                <div class="type-header user-training-header">
                    <h2>Ваш обраний тип тренування</h2>
                    <button class="user-training-button-delete" @click="openModal" :class="{'delete-btn-open-active':isModalOpen}">Обрати інший тип тренування</button>
                </div>
                <div class="user-training-container">
                    <router-link class="link-box" to="/training">
                        <div class="user-training-card">
                            <p class="user-training-type">{{ userTrainingType.type }}</p>
                            <p class="user-training-description">{{ userTrainingType.description }}</p>
                            <img class="training-type-img" :src="'../../../public' + userTrainingType.image_link" :alt="userTrainingType.type">
                        </div>
                    </router-link>
                </div>
            </div>
        </div>
        <div class="ending-label">
            <p>Почни тренування зараз !</p>
        </div>
    </main>
    <Footer></Footer>
    <div v-if="isModalOpen" class="training-delete-modal-overlay" @click.self="closeModal">
        <div class="training-delete-modal-content">
            <h2>Ви хочете змінити тренування ?</h2>
            <p>Якщо Ви зміните тренування, то старий прогрес буде видалено</p>
            <div class="model-training-delete-btn-box">
                <button class="model-training-delete-btn-close" @click="closeModal">Відмінити</button>
                <button class="model-training-delete-btn-delete" @click="deleteUserTrainingType">Так</button>
            </div>
        </div>        
    </div>
</template>

<script>
    // import {mapActions, mapGetters} from "vuex";
    import {mapGetters, mapActions} from "vuex";
    // import router from '../../router';
    import Header from "../../components/header/Header.vue";
    import Footer from "../../components/footer/Footer.vue";
    import Notes from "../../components/note/Note.vue"

    export default {
        name: "Homepage",
        data() {
            return {
                currentIndex: 0,
                intervalId: null,
                trainingTypes: [],
                userTrainingType: {},
                recomendedTrainingType: {},
                popularTrainingType: {},
                isModalOpen: false,
                token: false
            }
        },
        computed: {
            ...mapGetters(['getPopularTrainingTypeData', 'getRecomendedTrainingTypeData', 'getUserTrainingTypeData', 'getTrainingTypesData', 'getSelectType']),
        },
        methods: {
            ...mapActions(['deleteUserType', 'getPopularType', 'getRecomemdedType', 'getUserType', 'getTypes', 'postSelectType']),
            openModal() {
                this.isModalOpen = true;
            },
            closeModal() {
                this.isModalOpen = false;
            },
            goToSlide(index) {
                this.currentIndex = index;
                this.resetAutoPlay();
            },
            nextSlide() {
                this.currentIndex = (this.currentIndex + 1) % 5; // Number of slides
            },
            startAutoPlay() {
                this.intervalId = setInterval(this.nextSlide, 5000);
            },
            resetAutoPlay() {
                clearInterval(this.intervalId);
                this.startAutoPlay();
            },
            switchSwipeLeft(sliderContainer) {
                // const sliderContainer = this.$refs.trainingSlider;
                sliderContainer.scrollBy({
                    top: 0,
                    left: -100,
                    behavior: 'smooth'
                });
                },
                switchSwipeRight(sliderContainer) {
                // const sliderContainer = this.$refs.trainingSlider;
                sliderContainer.scrollBy({
                    top: 0,
                    left: 100,
                    behavior: 'smooth'
                });
            },
            async selectTrainingType(trainingType){
                if(!sessionStorage.getItem("token")) return;
                const dto = {'type': trainingType};
                await this.postSelectType(dto);
                const selectType = this.getSelectType;
                if(selectType) { this.getRegisteredUserInfo()}
                else {console.log("selectType is", selectType)}
            },
            async deleteUserTrainingType() {
                await this.deleteUserType();
                const userTrType = this.getUserTrainingTypeData;
                this.userTrainingType = userTrType;
                this.closeModal();
                await this.getRegisteredUserInfo();
            },
            async getUnregisteredUserInfo() {
                await this.getTypes();
                const trType = this.getTrainingTypesData;
                if(trType.length > 0) this.trainingTypes = trType;
            },
            async getRegisteredUserInfo() {
                await this.getUserType();
                const userTrType = this.getUserTrainingTypeData;
                if(Object.keys(userTrType).length > 0) this.userTrainingType = userTrType;
                else { 
                    this.getUnregisteredUserInfo();
                    await this.getRecomemdedType();
                    await this.getPopularType();
                    const recTrType = this.getRecomendedTrainingTypeData;
                    const popTrType = this.getPopularTrainingTypeData;
                    if(recTrType !== null && recTrType !== undefined) {
                        if(Object.keys(recTrType).length > 0) this.recomendedTrainingType = recTrType;
                    }
                    if(popTrType !== null && popTrType !== undefined){
                        if(Object.keys(popTrType).length > 0) this.popularTrainingType = popTrType;
                    } 
                }
            },
        },
        components: {
            Header,
            Footer,
            Notes
        },
        mounted() {
            this.startAutoPlay();
            if(!sessionStorage.getItem("token")) {
                this.token = false;
                this.getUnregisteredUserInfo();
            }
            else {
                this.token = true;
                this.getRegisteredUserInfo();
            }
        },
        beforeDestroy() {
            clearInterval(this.intervalId);
        },
    };
</script>

<style scoped>

    .home-container {
        width: 100%;
        min-height: calc(101vh - 3.325rem - 45px);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .slider-container {
        position: relative;
        overflow: hidden;
        width: 90%;
        border-radius: 5px;
    }

    .slider-box {
        display: flex;
        transition: transform 0.5s ease;
    }

    .slide {
        min-width: 100%;
        height: 100%;
    }

    .slide-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }


    .slider-points {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .slide-point{
        width: 20px;
        height: 8px;
        background-color: rgb(33, 33, 33);
        margin: 8px 4px 4px 4px;
        border-radius: 2px;
        transition: all 0.2s ease;
        cursor: pointer;
    }

    .slide-point:hover{
        background-color: rgb(191, 55, 55);
    }

    .slide-point.active{
        background-color: aliceblue;
    }

    .training-info-container{
        width: 72%;
    }

    .training-info-box {
        width: 100%;
        display: flex;
        flex-direction: column; 
    }
    
    .type-header {
        color: aliceblue;
        font-family: 'Open Sans';
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 20px 0px 20px 0px;
        height: 35px;
    }

    .switch-training-slider {
        display: flex;
        width: 47px;
        justify-content: space-between;
        cursor: pointer;
        color: rgb(166, 170, 174);
    }

    .switch-training {
        font-size: 35px;
        transition: all 0.2s ease;
    }

    .switch-training:hover {
        color: aliceblue;
    }

    .training-slider-container{
        width: 100%;
        position: relative;
        overflow-x: scroll; /* Дозволяє горизонтальне прокручування */
        overflow-y: hidden; /* Приховує вертикальне прокручування, якщо є */
        scroll-snap-type: x mandatory; /* Включає скролл снапінг */
        -ms-overflow-style: none; /* Приховує смугу прокрутки в IE та Edge */
        scrollbar-width: none; /* Приховує смугу прокрутки в Firefox */
    }

    .training-slider-box{
        display: flex;
        transition: transform 0.5s ease;
    }

    .training-card {
        height: 420px;
        width: 324px;
        background-color: rgb(31, 31, 31);
        border-radius: 5px;
        flex: 0 0 auto;
        position: relative;
        scroll-snap-align: start;
        cursor: pointer;
        transition: all 0.3s ease;
        overflow: hidden;
    }

    .training-card:first-of-type {
        margin-right: 5px;
    }

    .training-card:last-of-type {
        margin-left: 5px;
    }

    .training-card:not(:first-of-type):not(:last-of-type) {
        margin: 0px 5px;
    }

    .training-type-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: all 0.3s ease;
    }

    .training-card-type {
        z-index: 1;
        color: aliceblue;
        position: absolute;
        top: 30px;
        font-size: 15px;
        left: 20px;
        font-family: 'Open Sans';
        font-weight: bold;
        width: 90%;
        transition: all 0.3s ease;
    }

    .training-card:hover .training-card-type {
        font-size: 17px;
    }

    .training-card::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        /* box-shadow: inset 0 0 0 0 rgba(0, 0, 0, 0.45); */
        transition: box-shadow 0.2s ease;
    }

    .training-card:hover .training-type-img {
        scale: 1.05;
    }

    .training-card:hover::after {
        box-shadow: inset 0px 0px 400px 300px #00000045;
    }

    .training-card:hover .training-card-description {
        opacity: 1;
        left: 20px;
    }

    .training-card:hover .training-card-description::after {
        width: 75%;
    }

    .training-card-description {
        z-index: 1;
        color: aliceblue;
        opacity: 0;
        position: absolute;
        top: 120px;
        font-size: 15px;
        left: 0px;
        font-family: 'Open Sans';
        font-weight: bold;
        width: 90%;
        transition: all 0.3s ease;
        text-align: left;
    }
    
    .training-card-description::after {
        content: "";
        position: absolute; 
        top: -10px; 
        left: 0px; 
        width: 30%; 
        height: 2.5px; 
        background-color: aliceblue; 
        transition: all 0.5s ease;
    }

    .recomended-training-container, .user-training-container {
        overflow: hidden;
        border-radius: 5px;
        width: 100%;
    }

    .recomended-training-card, .user-training-card {
        width: 100%;
        position: relative;
        cursor: pointer;
    }

    .recomemded-type, .user-training-type {
        z-index: 1;
        color: aliceblue;
        position: absolute;
        top: 70px;
        font-size: 35px;
        left: 50px;
        font-family: 'Open Sans';
        font-weight: bold;
        width: 90%;
        transition: all 0.3s ease;
    }

    .recomemded-description, .user-training-description {
        z-index: 1;
        color: aliceblue;
        position: absolute;
        top: 115px;
        font-size: 25px;
        left: 0px;
        font-family: 'Open Sans';
        font-weight: bold;
        width: 90%;
        transition: all 0.3s ease;
        text-align: left;
        opacity: 0;
    }

    .recomemded-description::after, .user-training-description::after  {
        content: "";
        position: absolute;
        top: -10px; 
        left: 0px; 
        width: 20%; 
        height: 3px; 
        background-color: aliceblue; 
        transition: all 0.5s ease;
    }

    .recomended-training-card::after, .user-training-card::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        /* box-shadow: inset 0 0 0 0 rgba(0, 0, 0, 0.45); */
        transition: box-shadow 0.3s ease;
    }

    .recomended-training-card:hover .recomemded-type, .user-training-card:hover .user-training-type {
        font-size: 20px;
    }

    .recomended-training-card:hover .training-type-img, .user-training-card:hover .training-type-img {
        scale: 1.05;
    }

    .recomended-training-card:hover::after, .user-training-card:hover::after {
        box-shadow: inset 0px 0px 600px 400px rgba(0, 0, 0, 0.43);
    }

    .recomended-training-card:hover .recomemded-description, .user-training-card:hover .user-training-description {
        opacity: 1;
        left: 20px;
    }

    .recomended-training-card:hover .recomemded-description::after, .user-training-card:hover .user-training-description::after {
        width: 75%;
    }

    .user-training-button-delete {
        font-family: 'Open Sans';
        height: 100%;
        border: none;
        /* background: aliceblue;
        color: rgb(19, 19, 19); */
        background: rgb(19, 19, 19);
        color: aliceblue;
        transition: all 0.16s ease-in;
        cursor: pointer;
        border-radius: 3px;
        width: 250px;
        font-weight: bold;
    }

    .user-training-button-delete:hover {
        background: aliceblue;
        color: rgb(19, 19, 19);
    }

    .delete-btn-open-active {
        background: aliceblue;
        color: rgb(19, 19, 19);
    }

    .popular-recomended-training-container {
        width: 100%;
        overflow-x: scroll;
        overflow-y: hidden;
        scroll-snap-type: x mandatory;
        -ms-overflow-style: none;
        scrollbar-width: none;
        border-radius: 5px;
        /* justify-content: center;
        overflow: hidden; */
    }

    .popular-recomended-training-box {
        display: flex;
        transition: transform 0.5s ease;
    }

    .popular-recomended-training-card {
        width: 640px;
        height: 300px;
        border-radius: 5px;
        flex: 0 0 auto;
        position: relative;
        scroll-snap-align: start;
        overflow: hidden;
        cursor: pointer;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    .popular-recomended-training-card:nth-child(1) {
        margin-right: 5px
    }

    .popular-recomended-training-card:nth-child(2) {
        margin-left: 5px
    }

    .popular-recomended-label {
        z-index: 1;
        color: aliceblue;
        position: absolute;
        top: 70px;
        font-size: 20px;
        left: 20px;
        font-family: 'Open Sans';
        font-weight: bold;
        opacity: 0;
        width: 90%;
        transition: all 0.3s ease;
    }

    .popular-recomended-type {
        z-index: 1;
        color: aliceblue;
        position: absolute;
        top: 40px;
        font-size: 25px;
        left: 50px;
        font-family: 'Open Sans';
        font-weight: bold;
        width: 90%;
        transition: all 0.3s ease;
    }

    .popular-recomemded-description {
        z-index: 1;
        color: aliceblue;
        position: absolute;
        top: 115px;
        font-size: 20px;
        left: 0px;
        font-family: 'Open Sans';
        font-weight: bold;
        width: 90%;
        transition: all 0.3s ease;
        text-align: left;
        opacity: 0;
    }

    .popular-recomemded-description::after  {
        content: "";
        position: absolute; /* Абсолютне позиціонування відносно .next */
        top: -10px; /* Розміщуємо лінію внизу */
        /* left: 50%;  */
        left: 0px; 
        /* transform: translateX(-50%); */
        width: 20%; /* Ширина лінії - 33% */
        height: 3px; /* Висота лінії */
        background-color: aliceblue; /* Колір лінії */
        transition: all 0.5s ease;
    }

    .popular-recomended-training-card::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        /* box-shadow: inset 0 0 0 0 rgba(0, 0, 0, 0.45); */
        transition: box-shadow 0.3s ease;
    }

    .popular-recomended-training-card:hover .popular-recomended-type {
        font-size: 28px;
        top: 30px;
    }

    .popular-recomended-training-card:hover .training-type-img{
        scale: 1.05;
    }

    .popular-recomended-training-card:hover::after {
        box-shadow: inset 0px 0px 600px 400px rgba(0, 0, 0, 0.43);
    }

    .popular-recomended-training-card:hover .popular-recomemded-description {
        opacity: 1;
        left: 20px;
    }

    .popular-recomended-training-card:hover .popular-recomended-label {
        opacity: 1;
        left: 50px;
    }

    .popular-recomended-training-card:hover .popular-recomemded-description::after{
        width: 75%;
    }

    .ending-label {
        width: 72%;
        height: 130px;
        border-radius: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Open Sans';
        color: aliceblue;
        background: #202020;;
        margin: 45px 0px 30px 0px;
    }

    .ending-label p {
        font-size: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
    }

        /* Стилізація модального вікна */
        .training-delete-modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        /* background: rgba(0, 0, 0, 0.5); */
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 999;
    }

    .training-delete-modal-content {
        background: #1c1c1c;
        border-radius: 5px;
        width: 540px;
        height: 200px;
        color: aliceblue;
        font-family: 'Open Sans';
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 1px 1px 12px 4px #00000021;
        animation: ShowModal 0.3s ease forwards;
    }

    @keyframes ShowModal {
        0% {
            transform: scale(0.5);
            top: 2.325rem;
            opacity: 0;
        }
        100% {
            transform: scale(1);
            top: 3.325rem;
            opacity: 1;
        }
    }

    .training-delete-modal-content h2 {
        margin-top: 18px;
        width: 75%;
        border-bottom: 1px solid aliceblue;
        text-align: center;
        padding-bottom: 5px;
        font-size: 23px;

    }

    .training-delete-modal-content p {
        margin-top: 5px;
        font-size: 15px;
    }

    .model-training-delete-btn-box {
        width: 75%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 30px
    }
   
    .model-training-delete-btn-close, .model-training-delete-btn-delete {
        margin: 10px 0;
        width: 180px;
        height: 35px;
        border-radius: 4px;
        border:none;
        background: aliceblue;
        font-family: 'Open Sans';
        font-size: 14px;
        transition: all 0.1s ease-in-out;
        cursor: pointer;
    }

    .model-training-delete-btn-close:hover, .model-training-delete-btn-delete:hover {
        background: #313131;;
        color: aliceblue;
    }

</style>