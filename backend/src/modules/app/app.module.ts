import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule, ConfigService } from '@nestjs/config/dist';
import { AuthModule } from '../auth/auth.module';
import config from '../../configurations';
import { SequelizeModule } from '@nestjs/sequelize';
import { User } from '../auth/models/user.model';
import { UserDisease } from '../auth/models/diseases.model';
import { UserMetrics } from '../auth/models/metrics.model';
import { ExerciseModule } from '../exercise/exercise.module';
import { Exercise } from '../exercise/models/exercise.model';
import { TrainingTypesModule } from '../training_types/training_types.module';
import { TrainingType } from '../training_types/models/training_types.model';
import { NotesModule } from '../notes/notes.module';
import { Notes } from '../notes/models/notes.model';
import { NutritionModule } from '../nutrition/nutrition.module';
import { Nutrition } from '../nutrition/models/nutrition.model';
import { ProgressModule } from '../progress/progress.module';
import { Progress } from '../progress/models/progress.model';
import { TokenModule } from '../token/token.module';
import { UsersModule } from '../users/users.module';
import { Diseases } from '../exercise/models/diseases.model';
import { ExerciseDiseases } from '../exercise/models/exercise_diseases.model';
import { UserTrainingType } from '../training_types/models/user_training_types.model';
import { RecommendedDailyCalorie } from '../nutrition/models/recommended_daily_calorie.model';
import { NutritionDiseases } from '../nutrition/models/nutrition_deseases.model';
import { DiabeticNutrition } from '../nutrition/models/diabetic_nutrition.model';

@Module({
  imports: [ConfigModule.forRoot({
    isGlobal: true,
    load: [config]
  }), 
  SequelizeModule.forRootAsync({
    imports: [ConfigModule],
    inject:[ConfigService],
    useFactory: (ConfigService: ConfigService) => ({
      dialect: 'mysql',
      host: ConfigService.get('db_host'),
      database: ConfigService.get('db_name'),
      username: ConfigService.get('db_user'),
      password: ConfigService.get('db_password'),
      port: ConfigService.get('db_port'),
      synchronize: true,
      autoLoadModels: true,
      models: [User, UserDisease, UserMetrics, TrainingType, 
        Exercise, Notes, Nutrition, Progress, Diseases, 
        ExerciseDiseases, UserTrainingType, RecommendedDailyCalorie, 
        NutritionDiseases, DiabeticNutrition]
    })
  }),
  AuthModule, ExerciseModule, TrainingTypesModule, NotesModule, NutritionModule, ProgressModule, TokenModule, UsersModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
