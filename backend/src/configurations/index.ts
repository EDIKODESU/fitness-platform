export default () => ({
    port: process.env.PORT,
    db_host: process.env.DB_HOST,
    db_name: process.env.DB_NAME,
    db_username: process.env.DB_USER,
    db_password: process.env.DB_PASSWORD,
    db_port: process.env.DB_PORT,
    secret_jwt: process.env.SECRET,
    expire_jwt:process.env.EXPIRE_JWT
})
