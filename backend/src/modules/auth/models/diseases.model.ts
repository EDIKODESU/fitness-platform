import { Model, Column, ForeignKey, Table, DataType, BelongsTo, PrimaryKey } from 'sequelize-typescript';
import { User } from './user.model';

@Table({ tableName: 'user_diseases', timestamps: false})
export class UserDisease extends Model {
    @Column(DataType.BOOLEAN)
    asthma: boolean;

    @Column(DataType.BOOLEAN)
    diabetes: boolean;

    @Column(DataType.BOOLEAN)
    heart: boolean;

    @Column(DataType.BOOLEAN)
    joints: boolean;

    @PrimaryKey
    @ForeignKey(() => User)
    @Column
    user_id: number;

    @BelongsTo(() => User)
    user: User;
}
