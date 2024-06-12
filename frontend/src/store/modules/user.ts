import { instance, instanceAuth } from "../../axios/index";
import type { ActionContext } from 'vuex';
import type { AxiosResponse } from 'axios';

interface State {
    userData: object,
    auth: boolean,
    statusUpdate: boolean,
    registerUser: object
}

export default {
    state: {
        auth: false,
        userData: {},
        statusUpdate: false,
        registerUser: {}
        // початковий стан вашого застосунку
      },
      mutations: {
        updatedAuth(state: State, auth: boolean) {
            state.auth = auth
        },
        updatedUserData(state: State, userData: object) {
            state.userData = userData;
        },
        updatedStatusUpdate(state: State, statusUpdate: boolean) {
            state.statusUpdate = statusUpdate;
        },
        updatedRegisterUser(state: State, registerUser: object) {
            state.registerUser = registerUser;
        }
        // мутації для зміни стану
      },
      actions: {
        async postRegister(ctx: ActionContext<State, any>, dto: object) {
            await instance.post("/auth/registration", dto)
            .then(function (response: AxiosResponse<any>) {
                const newToken = response.data.token;
                const findedUser = response.data;
                delete findedUser['token'];
                ctx.commit("updatedUserData", findedUser);
                ctx.commit("updatedAuth", true);
                sessionStorage.setItem("token", newToken);
                sessionStorage.setItem("username", findedUser.username);
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedAuth", false);
            });
        },
        async postLogin(ctx: ActionContext<State, any>, dto: object) {
            await instance.post("/auth/login", dto)
            .then(function (response: AxiosResponse<any>) {
                const newToken = response.data.token;
                const findedUser = response.data;
                delete findedUser['token'];
                ctx.commit("updatedUserData", findedUser);
                ctx.commit("updatedAuth", true);
                sessionStorage.setItem("token", newToken);
                sessionStorage.setItem("username", findedUser.username);
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedAuth", false);
            });
        },
        async updateUserData(ctx: ActionContext<State, any>, dto: object) {
            await instanceAuth().patch("/users/update", dto)
            .then(function (response: AxiosResponse<any>) {
                const newToken = response.data.token;
                const updateUser = response.data;
                delete updateUser['token'];
                ctx.commit("updatedUserData", updateUser);
                ctx.commit("updatedStatusUpdate", true);
                sessionStorage.setItem("token", newToken);
                sessionStorage.setItem("username", updateUser.username);
            })
            .catch(function (error: object) {
                console.log(error);
                // ctx.commit("updatedUserData", {});
                ctx.commit("updatedStatusUpdate", false);
            });
        },
        async getRegisterUser(ctx: ActionContext<State, any>) {
            await instanceAuth().get("/users/me")
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedRegisterUser", response.data);
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedRegisterUser", {});
            });
        },
        async clearDataUser(ctx: ActionContext<State, any>) {

            ctx.commit("updatedAuth", false);
            ctx.commit("updatedUserData", {});
            ctx.commit("updatedStatusUpdate", false);
            ctx.commit("updatedRegisterUser", {});
        }
        // дії для виконання асинхронних операцій та виклику мутацій
      },
      getters: {
        getAuthStatus(state: State): boolean {
            return state.auth
        },
        getStatusUpdate(state: State): boolean {
            return state.statusUpdate
        },
        getRegisterUserData(state: State): object {
            return state.registerUser
        },
        // getDate(state: State): object {
        //     return state.userData
        // }
      }
}