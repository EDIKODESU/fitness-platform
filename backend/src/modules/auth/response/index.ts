import { ApiProperty } from "@nestjs/swagger";
import { IsString, IsNumber} from "class-validator";

export class AuthUserResponse {
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
    @IsString()
    token: string;
}


