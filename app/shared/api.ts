import { User } from "./types"

// function handleErrors(response:Response) {
    // TODO: add errors to server 
    // if (!response.ok) {
    //     console.log(JSON.stringify(response));
    //     throw Error(response.statusText);
    // }
// }

export class API {
    user: User
    api_url = "https://ratiocal.herokuapp.com";
    headers = {
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }
    }

    constructor(username:String, password:String) {
        console.log("Constructing");

        this.loginUser(username, password)
            .then((userInfo) => {
                this.user = <User> userInfo;
            })
            .catch(error => {
                console.log(error);
            });
    }


    async loginUser(username:String, password:String){
        let sendJson = {
            username : username,
            password : password
        };

        let response = await fetch(`${this.api_url}/api/user/login`,{
            ...this.headers,
            method: "POST",
            body: JSON.stringify(sendJson)
        });

        let json = await response.json();

        return json;
    }


    async  registerUser(username:String, email:String, password:String){
        let sendJson = {
            username : username,
            email : email,
            password : password
        }

        let response = await fetch(`${this.api_url}/api/user/create`,{
            ...this.headers,
            method: "POST",
            body: JSON.stringify(sendJson)
        });

        return await response.json();
    }

    async  getEvents() {

        let sendJson = {
            slug: this.user.slug,
            password: this.user.passwordHash
        }

        let response = <Response>await fetch(`${this.api_url}/api/events`,{
            ...this.headers,
            method: "POST",
            body: JSON.stringify(sendJson)
        });

        return await response.json()
    }

}

