import { createStore } from 'vuex';
import userModule from "./modules/user";
import trainingTypeModule from "./modules/training-type";
import progressModule from "./modules/progress";
import nutrationModule from "./modules/nutration";
import exerciseModule from "./modules/exercise";
import noteModule from "./modules/note";

export default createStore({
  modules: {
    user: userModule,
    trainingType: trainingTypeModule,
    progress: progressModule,
    nutration: nutrationModule,
    exercise: exerciseModule,
    note: noteModule,
    // модулі
  }
});