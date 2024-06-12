import { Controller, Get, Req, UseGuards } from '@nestjs/common';
import { ExerciseService } from './exercise.service';
import { ApiResponse, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from 'src/guards/jwt-guard';
import { UserExercisesResponse } from './response';

@Controller('exercise')
export class ExerciseController {
    constructor(private readonly exersiceService: ExerciseService) {}

    @ApiTags("Service")
    @ApiResponse({status: 200, type: UserExercisesResponse})
    @UseGuards(JwtAuthGuard)
    @Get()
    getExercises(@Req() request): Promise<UserExercisesResponse[]>{
        const user = request.user
        return this.exersiceService.getExercises(user.login);
    }
}
