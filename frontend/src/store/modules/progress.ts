import { instance, instanceAuth } from "../../axios/index";
import type { ActionContext } from 'vuex';
import type { AxiosResponse } from 'axios';

interface State {
    progressData: object,
    deleteLastProgress: boolean,
    addProgressData: boolean
}

export default {
    state: {
        progressData: {},
        deleteLastProgress: false,
        addProgressData: false
        // початковий стан вашого застосунку
      },
      mutations: {
        updatedProgressData(state: State, progressData: object) {
            state.progressData = progressData;
        },
        updatedDeleteLastProgress(state: State, deleteLastProgress: boolean) {
            state.deleteLastProgress = deleteLastProgress;
        },
        updatedAddProgressData(state: State, addProgressData: boolean) {
            state.addProgressData = addProgressData;
        },
        // мутації для зміни стану
      },
      actions: {
        async postAddProgress(ctx: ActionContext<State, any>, dto: object) {
            await instanceAuth().post("/progress/add", dto)
            .then(function (response: AxiosResponse<any>) {
                if(response.data) ctx.commit("updatedAddProgressData", true);
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedAddProgressData", false);
            });
        },
        async getProgress(ctx: ActionContext<State, any>) {
            await instanceAuth().get("/progress")
            .then(function (response: AxiosResponse<any>) {
                // console.log(response.data);
                ctx.commit("updatedProgressData", response.data);
            })
            .catch(function (error: object) {
                console.log(error);
            });
        },
        async deleteProgress(ctx: ActionContext<State, any>) {
            await instanceAuth().delete("/progress/delete-last")
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedDeleteLastProgress", true);
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedDeleteLastProgress", false);
            });
        },
        async clearProgressData(ctx: ActionContext<State, any>) {
            ctx.commit("updatedProgressData", {});
            ctx.commit("updatedDeleteLastProgress", false);
            ctx.commit("updatedAddProgressData", false);
        }
        // дії для виконання асинхронних операцій та виклику мутацій
      },
      getters: {
        getProgressData(state: State): object {
            return state.progressData
        },
        getDeleteLastProgress(state: State): boolean {
            return state.deleteLastProgress
        },
        getAddProgressData(state: State): boolean {
            return state.addProgressData
        },
      }
}