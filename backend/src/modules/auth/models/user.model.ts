import { Column, Model, Table,PrimaryKey, AutoIncrement } from "sequelize-typescript";

@Table({ tableName: 'user', timestamps: false })
export class User extends Model{
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @Column
    username: string;

    @Column
    firstName: string;

    @Column
    lastName: string;

    @Column
    login: string;

    @Column
    password: string;

    @Column
    email: string;
}