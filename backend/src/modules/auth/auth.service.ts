import { Injectable, BadRequestException } from '@nestjs/common';
import { Op } from 'sequelize';
import { InjectModel } from '@nestjs/sequelize';
import { User } from './models/user.model';
import {UserMetrics} from './models/metrics.model';
import {UserDisease} from './models/diseases.model';
import { CreateUserDTO, LoginUserDto } from './dto';
import * as bcrypt from 'bcrypt';
import { AppError } from 'src/common/constants/errors';
import { AuthUserResponse } from './response';
import { TokenService } from '../token/token.service';

@Injectable()
export class AuthService {
    constructor(
        @InjectModel(User) private readonly userRepository: typeof User,
        @InjectModel(UserMetrics) private readonly userMetricsRepository: typeof UserMetrics,
        @InjectModel(UserDisease) private readonly userDiseaseRepository: typeof UserDisease, 
        private readonly tokenService: TokenService
    ) {}

    async hashPassword(password: string): Promise<string> {
        return bcrypt.hash(password, 10);
    }

    async findUser(email : string, login : string): Promise<User> {
        const condition = {
            [Op.or]: [
                { email: email },
                { login: login },
            ],
        };

        return this.userRepository.findOne({where: condition});
    }

    async responseUserData(user: User, metrics: UserMetrics): Promise<AuthUserResponse> {
        const token = await this.tokenService.generateJwtToken({
            "id": user.id,
            "login": user.login,
            "email": user.email
        });

        return {
            "username": user.username,
            "firstName": user.firstName,
            "lastName": user.lastName,
            "login": user.login,
            "email": user.email,
            "age": metrics.age,
            "weight": metrics.weight,
            "height": metrics.height,
            "body_type": metrics.body_type,
            "activity": metrics.activity,
            "sex": metrics.sex,
            "token" :token
        }
    }

    async createUser(dto: CreateUserDTO): Promise<AuthUserResponse> {
        try {
            const existUser = await this.findUser(dto.email, dto.login);

            if (existUser)  throw new BadRequestException(AppError.USER_EXIST);
    
            dto.password = await this.hashPassword(dto.password);
    
            const user = await this.userRepository.create({
                username: dto.username,
                firstName: dto.firstName,
                lastName: dto.lastName,
                login: dto.login,
                password: dto.password,
                email: dto.email,
            });
    
            const metrics = await this.userMetricsRepository.create({
                user_id: user.id,
                body_type: dto.body_type,
                activity: dto.activity,
                sex: dto.sex,
                age: dto.age,
                weight: dto.weight,
                height: dto.height,
            });
    
            await this.userDiseaseRepository.create({
                user_id: user.id,
                asthma: dto.asthma,
                diabetes: dto.diabetes,
                heart: dto.heart,
                joints: dto.joints,
            });
    
            const existNewUser = await this.findUser(user.email, user.login);
    
            const NewUser = await this.responseUserData(existNewUser, metrics);
    
            return NewUser; 

        } catch(e) {
            throw new Error(e);
        }
    }

    async getMetrics(userId: number){
        return this.userMetricsRepository.findOne({where: {user_id: userId}})
    }

    async loginUser(dto: LoginUserDto): Promise<AuthUserResponse> {
        try {
            const existUser = await this.findUser(dto.loginData, dto.loginData);

            if (!existUser)  throw new BadRequestException(AppError.USER_NOT_EXIST);
    
            const validatePassword = await bcrypt.compare(dto.password, existUser.password);
    
            if (!validatePassword) throw new BadRequestException(AppError.WRONG_DATA);
    
            const metrics = await this.getMetrics(existUser.id);
    
            const user = await this.responseUserData(existUser, metrics);
    
            return user;
            
        } catch(e) {
            throw new Error(e);
        }
    }


}
