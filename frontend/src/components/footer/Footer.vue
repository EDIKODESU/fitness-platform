<template>
    <footer>
        <div class="footer-info-box">
            <p>
                FitLife © 2023–2024
            </p>
            <div class="img-ref-box">
                <a href=""><img class="img-ref" src="../../../public/social_networks/x.svg" alt="x"></a>
                <a href=""><img class="img-ref" src="../../../public/social_networks/instagram.svg" alt="instagram"></a>
                <a href=""><img class="img-ref" src="../../../public/social_networks/discord.svg" alt="discord"></a>
                <a href=""><img class="img-ref" src="../../../public/social_networks/github.svg" alt="github"></a>
                <a href=""><img class="img-ref" src="../../../public/social_networks/linkedin.svg" alt="linkedin"></a>
                <a href=""><img class="img-ref" src="../../../public/social_networks/telegram.svg" alt="telegram"></a>
            </div>
        </div>
    </footer>
</template>

<script>
// import { mapMutations } from 'vuex';
// import router from "../../routers/index"

export default {

    methods: {
    }
}
</script>

<style scoped>
    footer {
        width: 100%;
        height: 45px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .footer-info-box {
        width: 72%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        color: #b8c3cc;
        font-family: 'Open Sans';
    }

    .img-ref-box {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .img-ref-box a {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 22px;
        height: 22px;
        margin: 0 5px;
        padding: 3px;
        /* background-color: aliceblue; */
        border-radius: 5px;
    }

    .img-ref-box a:hover .img-ref {
        filter: invert(79%);
    }

    .img-ref {
        width: 19px;
        height: 19px;
        transition: all 0.3s cubic-bezier(.33,1,.68,1);
    }
</style>
