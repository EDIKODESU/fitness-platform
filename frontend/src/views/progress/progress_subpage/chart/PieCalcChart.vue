<template>
  <div v-if="re_render" class="chartPie">
      <Pie
          style="height: 212px; width: 404px;"
          id="my-chart-id"
          :options="chartOptions"
          :data="chartDataComputed"
      />
  </div>
</template>

<script>
  import { Pie } from 'vue-chartjs'
  import {
    Chart as ChartJS,
    Title,
    Tooltip,
    Legend,
    ArcElement,
    CategoryScale
  } from 'chart.js'

  ChartJS.register(Title, Tooltip, Legend, ArcElement, CategoryScale)

  export default {
    name: 'PieChart',
    components: { Pie },
    props: {
      carbohydrates: {
        type: Number,
        required: true
      },
      fats: {
        type: Number,
        required: true
      },
      protein: {
        type: Number,
        required: true
      }
    },
    data() {
      return {
        re_render: true, // Початково встановлено в false, оскільки ми хочемо затримати рендер
        chartData: {
          labels: ['Протеїн', 'Жири', 'Вуглеводи'],
          datasets: [{
            data: [this.protein, this.fats, this.carbohydrates],
            backgroundColor: ['#41B883', '#E46651', '#00D8FF'],
          }]
        },
        chartOptions: {
          responsive: true,
          maintainAspectRatio: false,
        }
      }
    },
    computed: {
      chartDataComputed() {
        return this.chartData;
      }
    },
    methods: {
      async forcedReRender() {
        this.re_render = false;
        await this.$nextTick();
        this.re_render = true;
      },
      updateChartData() {
        this.chartData.labels = ['Протеїн', 'Жири', 'Вуглеводи'];
        this.chartData.datasets[0].data = [this.protein, this.fats, this.carbohydrates];
      },
      changeChart() {
        clearTimeout(this.renderTimeout); // Скидаємо попередній таймер, якщо він був встановлений
        this.renderTimeout = setTimeout(() => {
          this.updateChartData();
          this.forcedReRender();
        }, 200); // Встановлюємо таймер на 2 секунди після останньої зміни
      }
    },
    watch: {
      protein: {
        handler() { this.changeChart(); },
      },
      fats: {
        handler() { this.changeChart(); },
      },
      carbohydrates: {
        handler() { this.changeChart(); },
      }
    },
  }
</script>
