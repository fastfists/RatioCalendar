var url = "https://52068872.ngrok.io";

export type User = { 
    username: string,
    slug: string,
    email: string,
    password: string
};
export let user: User;

export function setup() {
    loginUser("fastfist", "fastfist22")
        .then((userInfo) => {
            console.log("fuck a nigga bitch");
            user = userInfo
        });
}

let headers = {headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }}

export async function loginUser(username, password){
    let sendJson = {
        username : username,
        password : password
    };
    let response = await fetch(`${url}/api/user/login`,{
        ...headers,
        method: "GET",
        body: JSON.stringify(sendJson)
    });
    let json = await response.json();
    
    return <User> json;
}


export async function registerUser(username, email, password){
    let sendJson = {
        username : username,
        email : email,
        password : password
    }

    let response = await fetch(`${url}/api/user/create`,{
        ...headers,
        method: "GET",
        body: JSON.stringify(sendJson)
    });

    return await response.json();
}

export async function getEvents() {
    let sendJson = {
        slug: user.slug,
        password: user.password
    }

    let response = await fetch(`${url}/api/user/create`,{
        ...headers,
        method: "GET",
        body: JSON.stringify(sendJson)
    });

    return await response.json()

}
