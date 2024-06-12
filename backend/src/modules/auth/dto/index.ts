import { ApiProperty } from "@nestjs/swagger";
import { IsString, IsNumber, IsBoolean } from "class-validator";

export class CreateUserDTO {
    @ApiProperty()
    @IsString()
    username: string

    @ApiProperty()
    @IsString()
    firstName: string;

    @ApiProperty()
    @IsString()
    lastName: string;

    @ApiProperty()
    @IsString()
    login: string;

    @ApiProperty()
    @IsString()
    password: string;

    @ApiProperty()
    @IsString()
    email: string;

    @ApiProperty()
    @IsNumber()
    age: number;

    @ApiProperty()
    @IsNumber()
    weight!: number;

    @ApiProperty()
    @IsNumber()
    height!: number;

    @ApiProperty()
    @IsString()
    body_type: string;

    @ApiProperty()
    @IsString()
    activity: string;

    @ApiProperty()
    @IsString()
    sex: string;

    @ApiProperty()
    @IsBoolean()
    asthma: boolean;

    @ApiProperty()
    @IsBoolean()
    diabetes: boolean;

    @ApiProperty()
    @IsBoolean()
    heart: boolean;

    @ApiProperty()
    @IsBoolean()
    joints: boolean;
}

export class LoginUserDto {
    @ApiProperty()
    @IsString()
    loginData: string;

    @ApiProperty()
    @IsString()
    password: string;

}