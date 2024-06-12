import { instance, instanceAuth } from "../../axios/index";
import type { ActionContext } from 'vuex';
import type { AxiosResponse } from 'axios';

interface State {
    trainingTypesData: Array<object>,
    userTrainingTypeData: object,
    recomendedTrainingType: object,
    popularTrainingType: object,
    selectType: boolean
}

export default {
    state: {
        trainingTypesData: [],
        userTrainingTypeData: {},
        recomendedTrainingType: {},
        popularTrainingType: {},
        selectType: false
        // початковий стан вашого застосунку
      },
      mutations: {
        updatedTrainingTypesData(state: State, trainingTypesData: Array<object>) {
            state.trainingTypesData = trainingTypesData;
        },
        updatedUserTrainingTypeData(state: State, userTrainingTypeData: object) {
            state.userTrainingTypeData = userTrainingTypeData;
        },
        updatedRecomendedTrainingType(state: State, recomendedTrainingType: object) {
            state.recomendedTrainingType = recomendedTrainingType;
        },
        updatedPopularTrainingType(state: State, popularTrainingType: object) {
            state.popularTrainingType = popularTrainingType;
        },
        updatedSelectType(state: State, selectType: boolean) {
            state.selectType = selectType;
        },
        // мутації для зміни стану
      },
      actions: {
        async postSelectType(ctx: ActionContext<State, any>, dto: object) {
            await instanceAuth().post("/training-types/select-type", dto)
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedSelectType", response.data);
                // return response.data;
            })
            .catch(function (error: object) {
                console.log(error);
            });
        },
        async getTypes(ctx: ActionContext<State, any>) {
            await instance.get("/training-types/get-types")
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedTrainingTypesData", response.data);
            })
            .catch(function (error: object) {
                console.log(error);
            });
        },
        async getUserType(ctx: ActionContext<State, any>) {
            await instanceAuth().get("/training-types/get-user-type")
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedUserTrainingTypeData", response.data);
                ctx.commit("updatedSelectType", true);
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedSelectType", false);
            });
        },
        async getRecomemdedType(ctx: ActionContext<State, any>) {
            await instanceAuth().get("/training-types/recommended-type")
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedRecomendedTrainingType", response.data);
            })
            .catch(function (error: object) {
                console.log(error);
            });
        },
        async getPopularType(ctx: ActionContext<State, any>) {
            await instanceAuth().get("/training-types/popular-type")
            .then(function (response: AxiosResponse<any>) {
                // console.log(response.data)
                ctx.commit("updatedPopularTrainingType", response.data);
            })
            .catch(function (error: object) {
                console.log(error);
            });
        },
        async deleteUserType(ctx: ActionContext<State, any>) {
            await instanceAuth().delete("/training-types/delete-user-type")
            .then(function (response: AxiosResponse<any>) {
                if(response.data === true) {
                    ctx.commit("updatedUserTrainingTypeData", {});
                    ctx.commit("updatedSelectType", false);
                }
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedUserTrainingTypeData", {});
                ctx.commit("updatedSelectType", false);
            });
        },
        async clearDataTrainingType(ctx: ActionContext<State, any>) {

            ctx.commit("updatedUserTrainingTypeData", {});
            ctx.commit("updatedTrainingTypesData", []);
            ctx.commit("updatedRecomendedTrainingType", {});
            ctx.commit("updatedPopularTrainingType", {});
            ctx.commit("updatedSelectType", false);

        }
        // дії для виконання асинхронних операцій та виклику мутацій
      },
      getters: {
        getTrainingTypesData(state: State): Array<object> {
            return state.trainingTypesData
        },
        getUserTrainingTypeData(state: State): object {
            return state.userTrainingTypeData
        },
        getRecomendedTrainingTypeData(state: State): object {
            return state.recomendedTrainingType
        },
        getPopularTrainingTypeData(state: State): object {
            return state.popularTrainingType
        },
        getSelectType(state: State): boolean {
            return state.selectType
        },
        // getUsername(state: State): string {
        //     return state.username
        // }
      }
}