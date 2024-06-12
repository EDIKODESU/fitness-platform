import { Table, Column, Model, DataType, PrimaryKey, AutoIncrement, ForeignKey, BelongsTo } from 'sequelize-typescript';
import { User } from './user.model';

@Table({ tableName: 'user_metrics', timestamps: false })
export class UserMetrics extends Model {
    @PrimaryKey
    @ForeignKey(() => User) // Вказуємо на зв'язок з таблицею користувачів
    @Column
    user_id: number;

    @BelongsTo(() => User) // Вказуємо на зв'язок "належить до" з таблицею користувачів
    user: User;

    @Column(DataType.ENUM('легка','середня','висока'))
    activity: 'легка' | 'середня' | 'висока';

    @Column(DataType.ENUM('ектоморф','мезоморф','ендоморф'))
    body_type: 'ектоморф' | 'мезоморф' | 'ендоморф';

    @Column(DataType.ENUM('жінка','чоловік'))
    sex: 'жінка' | 'чоловік';

    @Column
    age: number;

    @Column(DataType.FLOAT)
    weight: number;

    @Column(DataType.FLOAT)
    height: number;
}
