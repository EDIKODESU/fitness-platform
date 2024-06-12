import { instanceAuth } from "../../axios/index";
import type { ActionContext } from 'vuex';
import type { AxiosResponse } from 'axios';

interface State {
    nutrationData: Array<object>,
}

export default {
    state: {
        nutrationData: [],
        // початковий стан вашого застосунку
      },
      mutations: {
        updatedNutrationData(state: State, nutrationData: Array<object>) {
            state.nutrationData = nutrationData
        },
        // мутації для зміни стану
      },
      actions: {
        async getNutrationData(ctx: ActionContext<State, any>) {
            await instanceAuth().get("/nutrition")
            .then(function (response: AxiosResponse<any>) {
                console.log(response.data);
                ctx.commit("updatedNutrationData", response.data);
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedNutrationData", []);
            });
        },
        async clearDataNurrition(ctx: ActionContext<State, any>) {
          ctx.commit("updatedNutrationData", []);
        }
        // дії для виконання асинхронних операцій та виклику мутацій
      },
      getters: {
        getNutrations(state: State): object {
            return state.nutrationData
        },
      }
}