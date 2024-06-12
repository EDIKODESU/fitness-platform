import { Body, Controller, Post, UseGuards, Req } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateUserDTO, LoginUserDto } from './dto';
import { AuthUserResponse } from './response';
import { ApiResponse, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from 'src/guards/jwt-guard';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) {}

    @ApiTags("Service")
    @ApiResponse({status: 201, type: AuthUserResponse})
    @Post('registration')
    createUsers(@Body() dto: CreateUserDTO): Promise<AuthUserResponse> {
        return this.authService.createUser(dto);
    }

    @ApiTags("Service")
    @ApiResponse({status: 200, type: AuthUserResponse})
    @Post('login')
    login(@Body() dto: LoginUserDto): Promise<AuthUserResponse> {
        return this.authService.loginUser(dto);
    }

}
