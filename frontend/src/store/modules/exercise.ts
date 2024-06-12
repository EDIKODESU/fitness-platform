import { instanceAuth } from "../../axios/index";
import type { ActionContext } from 'vuex';
import type { AxiosResponse } from 'axios';

interface State {
    exerciseData: Array<object>,
}

export default {
    state: {
        exerciseData: [],
        // початковий стан вашого застосунку
      },
      mutations: {
        updatedExerciseData(state: State, exerciseData: Array<object>) {
            state.exerciseData = exerciseData
        },
        // мутації для зміни стану
      },
      actions: {
        async getExerciseData(ctx: ActionContext<State, any>) {
            await instanceAuth().get("/exercise")
            .then(function (response: AxiosResponse<any>) {
                console.log(response.data);
                ctx.commit("updatedExerciseData", response.data);
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedExerciseData", []);
            });
        },
        async clearDataExercises(ctx: ActionContext<State, any>) {
          ctx.commit("updatedExerciseData", []);
        }
        // дії для виконання асинхронних операцій та виклику мутацій
      },
      getters: {
        getExercises(state: State): object {
            return state.exerciseData
        },
      }
}