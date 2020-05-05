var url = "https://ratiocal.herokuapp.com";


export type Event = {
    name: string,
    description: string,
    date : Date
    user_id: number
} | number;

export type User = { 
    username: string,
    slug: string,
    email: string,
    password: string
    events: Array<Event>
};
export let user:User;

function handleErrors(response) {
    if (!response.ok) {
        console.log(JSON.stringify(response));
        throw Error(response.statusText);
    }
    return response;
}

export function setup() {
    loginUser("fastfist", "fastfist22")
        .then(handleErrors)
        .then((userInfo) => {
            user = <User> userInfo;
            console.log(user.username);
        })
        .catch(error => {
            console.log(error);
        });
}

let headers = {
    headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }
    }

export async function loginUser(username, password){
    let sendJson = {
        username : username,
        password : password
    };

    let response = await fetch(`${url}/api/user/login`,{
        ...headers,
        method: "POST",
        body: JSON.stringify(sendJson)
    });

    response = handleErrors(response);

    let json = await response.json();
    
    return json;
}


export async function registerUser(username, email, password){
    let sendJson = {
        username : username,
        email : email,
        password : password
    }

    let response = await fetch(`${url}/api/user/create`,{
        ...headers,
        method: "POST",
        body: JSON.stringify(sendJson)
    });
    response = handleErrors(response);

    return await response.json();
}

export async function getEvents() {
    let sendJson = {
        slug: user.slug,
        password: user.password
    }

    let response = await fetch(`${url}/api/user/create`,{
        ...headers,
        method: "POST",
        body: JSON.stringify(sendJson)
    });

    return await response.json()
}
