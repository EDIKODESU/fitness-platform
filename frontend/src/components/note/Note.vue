<template>
    <div class="note-container" :class="{'open-container': isOpen}">
      <div class="note-box">
        <button class="note-btn-close" @click="closeNote">×</button>
        <div class="note-content">
          <h1>Ваші записи</h1>
          <div class="note-filed-container" ref="noteContainer">
            <!-- бокс для доданих нотатків -->
            <div v-for="note in notes" :key="note.id" class="note-filed-box">
              <div class="note-filed-text-box">
                <p class="note-filed-text">{{ note.note }}</p>
              </div>
              <button @click="deleteUserNote(note)" class="note-input-btn-del-node">
                <img src="../../../public/note/trash.svg" alt="trash">
              </button>
            </div>
            <!-- кінець бокса для доданих нотатків -->
            <div class="note-input-box">
              <input maxlength="90" type="text" placeholder="напішіть свою нотатку" v-model="field">
            </div>
          </div>
          <div class="note-btn-box">
            <button @click="createUserNote" class="note-btn-create">Додати</button>
            <button @click="deleteAllUserNote" class="note-btn-delete-all">Видалити усе</button>
          </div>
        </div>
      </div>
      <button :class="{'note-btn-switch-active': isOpen}" class="note-btn-switch" @click="openNote">
        <p>Нотаток</p>
      </button>
    </div>
  </template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
    name: 'Note',
    data() {
    return {
        notes: [],
        isOpen: false,
        field: "",
    };
    },
    computed: {
        ...mapGetters(["getNotesData", "getStatusDelete", "getStatusAllDelete", "getStatusCteateNote"]),
    },
    methods: {
        ...mapActions(["deleteAllNotes", "deleteNote", "postCreateNote", "getNotes"]),
        async openNote() {
            this.isOpen = !this.isOpen;
            if (this.isOpen) {
                await this.getUserNotes();
                this.scrollToBottom();
            }
        },
        closeNote() {
            this.isOpen = false;
        },
        async createUserNote() {
            if (this.field === "") return;
            const dto = { "note": this.field };
            await this.postCreateNote(dto);
            const statusCreate = this.getStatusCteateNote;
            if (statusCreate) {
                await this.getUserNotes();
                this.scrollToBottom();
                this.field = "";
            } else {
                console.log("status err:", statusCreate);
            }
        },
        async deleteUserNote(note) {
            await this.deleteNote(note.id);
            const statusDel = this.getStatusDelete;
            if (statusDel) {
                const index = this.notes.findIndex(n => n.id === note.id);
            if (index !== -1) {
                this.notes.splice(index, 1);
            }
            } else {
                console.log("statusDel err:", statusDel);
            }
        },
        async deleteAllUserNote() {
            await this.deleteAllNotes();
            const statusAllDel = this.getStatusAllDelete;
            if (statusAllDel) {
                this.notes = [];
            } else {
                console.log("statusAllDel err:", statusAllDel);
            }
        },
        async getUserNotes() {
            if (!this.isOpen) return;
            await this.getNotes();
            const notes = this.getNotesData;
            if (notes && notes.length > 0) {
                this.notes = notes;
            } else {
                console.log(notes);
            }
        },
        scrollToBottom() {
            this.$nextTick(() => {
                const container = this.$refs.noteContainer;
                container.scrollTop = container.scrollHeight;
            });
        }
    },
    // mounted() {
    //     if (sessionStorage.getItem("token")) {
    //         this.getUserNotes();
    //     }
    // }
};
</script>

<style scoped>

.note-container {
    position: fixed;
    z-index: 2;
    display: flex;
    /* height: 400px; */
    /* width: 300px; */
    top: 39%;
    border-radius: 5px;
    /* align-items: center; */
    align-items: flex-start;
    flex-direction: row;
    justify-content: center;
    transition: all 0.3s ease;
    transform: translateX(-330px);
}

.open-container {
    transform: translateX(0px);
}

.note-box {
    width: 320px;
    height: 400px;
    position: relative;
    padding: 5px;
    background: #1c1c1c;
    border-radius: 0px 5px 5px 0px;
}

.note-btn-close {
    position: absolute;
    right: 10px;
    top: 10px;
    background: none;
    border: none;
    font-size: 22px;
    width: 20px;
    height: 20px;
    color: #7c3a3a;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: all 0.2s ease;
}

.note-btn-close:hover {
    color: #d1c1c1;
}


.note-content {
    width: 100%;
    display: flex;
    height: 100%;
    justify-content: center;
    flex-direction: column;
}

.note-content h1 {
    color: aliceblue;
    font-family: 'Open Sans';
    text-align: center;
    font-size: 18px;
    /* margin-top: 5px; */
    margin: 10px 0px;
}

.note-filed-container {
    width: 100%;
    height: calc(100% - 87px);
    display: flex;
    flex-direction: column;
    align-items: center;
    overflow-x: hidden;
    overflow-y: auto;
    scroll-snap-type: y mandatory;
    -ms-overflow-style: none; /* Для Internet Explorer і Edge */
    scrollbar-width: none; /* Для Firefox */
}

.note-filed-container::-webkit-scrollbar {
    display: none; /* Для Chrome, Safari та Opera */
}

.note-filed-box {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 90%; 
    height: 55px;
    margin-bottom: 10px;
    border: 1px solid aliceblue;
    border-radius: 5px;
    padding: 5px;
    box-sizing: border-box;
    background-color: #333; 
    flex-shrink: 0;
}

.note-filed-text-box {
    height: 30px;
    background: none;
    border: none;
    border-radius: 3px;
    width: 100%;
    padding: 0px 10px;
    margin: 0px 10px;
    display: flex;
    align-items: center;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
    -ms-overflow-style: none;
    scrollbar-width: none;
}

.note-filed-text-box::-webkit-scrollbar {
    display: none;
}

.note-filed-text {
    color: #d1c1c1;
}

.note-input-box {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 90%; 
    height: 55px;
    margin-bottom: 10px;
    flex-shrink: 0;
}

.note-input-box input{
    height: 30px;
    background: none;
    border: none;
    width: 100%;
    padding: 0px 10px;
    margin: 0px 10px;
    border-bottom: 1px solid aliceblue;
    transition: all 0.2s ease;
    color: #d1c1c1;
}

.note-input-box input:focus{
    outline: none;
    border: none;
    border-bottom: 1px solid #639064;;
}

.note-input-btn-del-node {
    display: flex;
    justify-content: center;
    cursor: pointer;
    border-radius: 3px;
    border: none;
    background: none;
    transition: all 0.3s ease;

}

.note-input-btn-del-node:hover {
    background-color: aliceblue;
}

.note-input-btn-del-node:hover img {
    filter: invert(79%);
}

.note-input-btn-del-node img {
    width: 30px;
    height: 30px;
    transition: all 0.3s ease;
}


.note-btn-box {
    width: 100%;
    display: flex;
    height: 42px;
    padding-top: 12px;
    border-top: 1px solid aliceblue;
    justify-content: space-evenly;
    margin-bottom: 7px;
}

.note-btn-create, .note-btn-delete-all {
    cursor: pointer;
    width: 120px;
    border: none;
    background: aliceblue;
    color: #1c1c1c;
    border-radius: 3px;
    transition: all 0.2s ease;
    font-family: 'Open Sans';
}

.note-btn-create:hover {
    background: #313131;
    color: aliceblue;
}

.note-btn-delete-all:hover {
    background: #313131;
    color: aliceblue;
}

.note-btn-switch {
    height: 100px;
    border: none;
    display: flex;
    width: 30px;
    background-color: #7c3a3a;
    margin-top: 40px;
    border-radius: 0px 5px 5px 0px;
    cursor: pointer;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 15px;
    font-family: 'Open Sans';
    transition: all 0.23s ease;
    color: aliceblue;
}

.note-btn-switch-active, .note-btn-switch:hover {
    background: aliceblue;
    color: #1c1c1c;
}

.note-btn-switch p {
    writing-mode: vertical-rl;
    text-orientation: mixed;
    transform: rotate(180deg);
    white-space: nowrap;
    transition: all 0.3s ease;
}

.note-btn-switch:hover p {
    color: #1c1c1c;
    scale: 1.23;
}
</style>