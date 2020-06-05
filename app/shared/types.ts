export interface Event {
    name: String;
    description: String;
    date : Date;
}

export interface User {
    username: String;
    slug: String;
    email: String;
    passwordHash: String;
    events: Array<Event>;
}

