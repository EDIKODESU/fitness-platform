import axios from "axios";

// const token = sessionStorage.getItem("token");

export const instance = axios.create({
    baseURL: 'http://localhost:3000',
    timeout: 1000,
    headers: {'X-Custom-Header': 'foobar'}
});

export const instanceAuth = () => {
  const token = sessionStorage.getItem("token");
  return axios.create({
    baseURL: 'http://localhost:3000',
    timeout: 1000,
    headers: {
      'X-Custom-Header': 'foobar',
      "Authorization": `Bearer ${token}`
    }
  });
};