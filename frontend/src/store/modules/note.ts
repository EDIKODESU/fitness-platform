import { instance, instanceAuth } from "../../axios/index";
import type { ActionContext } from 'vuex';
import type { AxiosResponse } from 'axios';

interface State {
    notes: Array<object>,
    deleteStatus: boolean,
    deleteAllStatus: boolean,
    createNotesStatus: boolean
}

export default {
    state: {
        notes: [],
        deleteStatus: false,
        deleteAllStatus: false,
        createNotesStatus: false,
        // початковий стан вашого застосунку
      },
      mutations: {
        updatedNotes(state: State, notes: Array<object>) {
            state.notes = notes
        },
        updatedDeleteStatus(state: State, deleteStatus: boolean) {
            state.deleteStatus = deleteStatus
        },
        updatedDeleteAllStatus(state: State, deleteAllStatus: boolean) {
            state.deleteAllStatus = deleteAllStatus
        },
        updatedCteateNoteStatus(state: State, createNotesStatus: boolean) {
            state.createNotesStatus = createNotesStatus
        },
        // мутації для зміни стану
      },
      actions: {
        async getNotes(ctx: ActionContext<State, any>) {
            await instanceAuth().get("/notes")
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedNotes", response.data);
            })
            .catch(function (error: object) {
                console.log(error);
            });
        },
        async postCreateNote(ctx: ActionContext<State, any>, dto: object) {
            await instanceAuth().post("/notes/create", dto)
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedCteateNoteStatus", true)
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedCteateNoteStatus", false);
            });
        },
        async deleteNote(ctx: ActionContext<State, any>, index: number) {
            await instanceAuth().delete(`/notes/delete/${index}`)
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedDeleteStatus", true)
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedDeleteStatus", false);
            });
        },
        async deleteAllNotes(ctx: ActionContext<State, any>) {
            await instanceAuth().delete("/notes/delete-all")
            .then(function (response: AxiosResponse<any>) {
                ctx.commit("updatedDeleteAllStatus", true)
            })
            .catch(function (error: object) {
                console.log(error);
                ctx.commit("updatedDeleteAllStatus", false);
            });
        },
        async clearDataNotes(ctx: ActionContext<State, any>) {

            ctx.commit("updatedNotes", []);
            ctx.commit("updatedDeleteStatus", false);
            ctx.commit("updatedDeleteAllStatus", false);
            ctx.commit("updatedCteateNoteStatus", false);
        }
        // дії для виконання асинхронних операцій та виклику мутацій
      },
      getters: {
        getNotesData(state: State): Array<object> {
            return state.notes
        },
        getStatusDelete(state: State): boolean {
            return state.deleteStatus
        },
        getStatusAllDelete(state: State): boolean {
            return state.deleteAllStatus
        },
        getStatusCteateNote(state: State): boolean {
            return state.createNotesStatus
        },
      }
}