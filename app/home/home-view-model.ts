import { Observable } from "tns-core-modules/data/observable";
import { Event, User } from "../shared/types";

export class HomeViewModel extends Observable {
    events: Array<Event>;
    user:  User;
    name : String;

    constructor() {
        super();

        this.user = { name: "Edith"};
        this.events = [
            {
                "date": new Date("2020-09-21T04:15:30"),
                "description": "They can't Stop us all",
                "name": "Storm Area 51",
            },
            {
                "date": new Date("2020-09-21T04:15:30"),
                "description": "They can't Stop us all",
                "name": "Storm Area 51",
            },
            {
                "date": new Date("2020-09-21T04:15:30"),
                "description": "They can't Stop us all",
                "name": "Storm Area 51",
            },
            {
                "date": new Date("2020-09-21T04:15:30"),
                "description": "They can't Stop us all",
                "name": "Storm Area 51",
            },
            {
                "date": new Date("2020-09-21T04:15:30"),
                "description": "They can't Stop us all",
                "name": "Storm Area 51",
            }
        ];
    }
}
