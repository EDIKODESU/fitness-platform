<template>
    <div class="register-card">
        <div class="card-content">
            <h2 class="register-form-headline">Дані про захворювання</h2>
            <p class="description-form">Якщо у Вас є захворювання з цього переліку, то оберіть його. Це допоможе обмежити харчування та тренування, які можуть бути небезпечними</p>
            <form class="register-form-diseases">
                <div class="register-diseases-box">
                    
                    <div class="disease-info-box">
                        <div class="disease-name">
                            <img class="disease-img" src="../../../../public/diseases/asthma.svg" alt="asthma">
                            <label for="asthma">Астма:</label>
                        </div>
                        <input type="checkbox" v-model="this.diseasesData.asthma" id="asthma" name="asthma" value="asthma">
                    </div>

                    <div class="disease-info-box">
                        <div class="disease-name">
                            <img class="disease-img" src="../../../../public/diseases/diabetes.svg" alt="diabetes">
                            <label for="diabetes">Діабет:</label>
                        </div>
                        <input type="checkbox" v-model="this.diseasesData.diabetes" id="diabetes" name="diabetes" value="diabetes">
                    </div>

                    <div class="disease-info-box">
                        <div class="disease-name">
                            <img class="disease-img" src="../../../../public/diseases/heart.svg" alt="heart">
                            <label for="heart">Серцеві захворювання:</label>
                        </div>
                        <input type="checkbox" v-model="this.diseasesData.heart"  id="heart" name="heart" value="heart">
                    </div>

                    <div class="disease-info-box">
                        <div class="disease-name">
                            <img class="disease-img" src="../../../../public/diseases/joints.svg" alt="joints">
                            <label for="joints">Проглеми з суглобами:</label>
                        </div>
                        <input type="checkbox" v-model="this.diseasesData.joints"  id="joints" name="joints" value="joints">
                    </div>

                </div>

                <div class="register-button-box">
                    <button @click.prevent="prevCard" class="back">Назад</button>
                    <button @click.prevent="checkData" class="next">Далі</button>
                </div>
            </form>
            <!-- <p class="err_box" v-show="err !== ''">{{ err }}</p> -->
        </div>
    </div>
</template>

<script>
    export default {
        name: "diseases",
        data() {
            return {
                diseasesData: {
                    joints: false,
                    heart: false,
                    diabetes: false,
                    asthma: false,
                },
                // err: ""
            }
        },
        props: {
            prevCard: {
                type: Function, // Вказуємо тип пропсу як функцію
                required: true // Опціонально, вказуємо, що це обов'язковий пропс
            }
        },
        methods: {
            checkData() {
                // this.err = ''
                this.$emit('diseases-updated', this.diseasesData);
            },
        },
    };
</script>

<style scoped>
    .register-form-diseases {
        color: aliceblue;
        width: 95%;
        display: flex;
        /* height: 92%; */
        flex-direction: column;
        align-items: center;
    }

    .register-diseases-box {
        margin: 10px 0 6px 0;
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        align-items: center;
        width: 100%;
    }

    .register-diseases-box input[type="checkbox"] {
        width: 20px;
        height: 20px;
        accent-color: #b3dc62;
        cursor: pointer;
        /* accent-color: rgb(19, 19, 19); */
    }

    
    .register-diseases-box label{
        cursor: pointer;
    }

    .disease-info-box {
        width: 72%;
        display: flex;
        justify-content: space-between;
        margin-bottom: 8px;
        font-family: 'Open Sans';
        font-size: large;
        align-items: center;
    }

    .disease-name {
        display: flex;
        align-items: center;
    }

    .disease-img {
        margin-right: 30px;
        width: 40px;
        border-radius: 5px;
        padding: 5px;
        background: aliceblue;
    }

    .register-button-box {
        width: 80%;
        display: flex;
        justify-content: space-between;
        text-align: center;
    }
</style>