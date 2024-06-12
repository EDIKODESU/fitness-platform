<template>
    <div v-if="re_render" class="chartBar">
        <Bar
            id="my-chart-id"
            :options="chartOptions"
            :data="chartData"
        />
    </div>
  </template>
  
  <script>
    import { Bar } from 'vue-chartjs'
    import {
        Chart as ChartJS,
        Title,
        Tooltip,
        Legend,
        BarElement,
        CategoryScale,
        LinearScale
    } from 'chart.js'
  
    ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)
  
    export default {
      name: 'BarChart',
      components: { Bar },
      props: {
        BMRData: {
            type: Array,
            required: false,
            default: () => ({})  // Provide a default empty object
        },
      },
      data() {
        return {
            re_render: false,
            chartData: {
                labels: this.BMRData.map((bmr, index) => index),
                datasets: [
                    {
                        label: 'БОР',
                        backgroundColor: '#f87979',
                        data: this.BMRData
                    }
                ]
                },
                chartOptions: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            }
        },
        watch: {
            BMRData: {
                immediate: true,
                handler() { this.changeChart() }
            }
        },
        methods: {
            async forcedReRender() {
                this.re_render = false;
                await this.$nextTick();
                this.re_render = true;
            },
            updateChartData() {
                this.chartData.labels = this.BMRData.map((bmi, index) => index);
                this.chartData.datasets[0].data = this.BMRData;
            },
            changeChart() {
                this.updateChartData();
                this.forcedReRender();
            }
        }
    }
  </script>
  
<style scoped>
    .chartBar {
        width: 100%;
        display: flex;
        justify-content: center;
    }
</style>