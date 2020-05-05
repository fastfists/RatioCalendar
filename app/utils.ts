var url = "https://ratiocal.herokuapp.com";

export type User = { 
    username: string,
    slug: string,
    email: string,
    password: string
};
export let user;

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

    console.log("Information");

    let response = await fetch(`${url}/api/user/login`,{
        ...headers,
        method: "GET",
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
        method: "GET",
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
        method: "GET",
        body: JSON.stringify(sendJson)
    });

    return await response.json()
}
