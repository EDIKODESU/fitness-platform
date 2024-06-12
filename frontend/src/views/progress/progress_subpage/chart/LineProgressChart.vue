<template>
    <div v-if="re_render" class="chartLineChart">
        <LineChartGenerator
            id="my-chart-id"
            :options="chartOptions"
            :data="chartData"
        />
    </div>
  </template>
  
  <script>
    import { Line as LineChartGenerator } from 'vue-chartjs'
    import {
        Chart as ChartJS,
        Title,
        Tooltip,
        Legend,
        LineElement,
        LinearScale,
        CategoryScale,
        PointElement
    } from 'chart.js'
  
    ChartJS.register(
        Title,
        Tooltip,
        Legend,
        LineElement,
        LinearScale,
        CategoryScale,
        PointElement
    )
  
    export default {
      name: 'LineChart',
      components: { LineChartGenerator },
      props: {
        BMIData: {
            type: Array,
            required: false,
            default: () => ({})  // Provide a default empty object
        },
      },
      data() {
        return {
            re_render: false,
            chartData: {
                labels: this.BMIData.map((bmi, index) => index),
                datasets: [
                    {
                        label: 'ІМТ',
                        backgroundColor: '#f87979',
                        data: this.BMIData
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
            BMIData: {
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
                this.chartData.labels = this.BMIData.map((bmi, index) => index);
                this.chartData.datasets[0].data = this.BMIData;
            },
            changeChart() {
                this.updateChartData();
                this.forcedReRender();
            }
        }
    }
  </script>
  
<style scoped>
    .chartLineChart {
        width: 100%;
        display: flex;
        justify-content: center;
    }
</style>