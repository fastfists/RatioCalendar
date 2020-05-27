<script> 
    import Event from './Event.svelte';
    import { Template } from "svelte-native/components";
    import { setup, user, getEvents } from '../utils';
    
    let events = [];
    let now = new Date("2020-09-21T04:15:30");

    /* setup(); */
    /* getEvents() */
    /*     .then(inEvents => { */
    /*         console.log("whooooo") */
    /*         console.log("whooooo") */
    /*         events = inEvents; */
    /*     }) */
    /*     .catch(e => { */
    /*         console.log("yyikes") */
    /*         console.log(e); */
    /*     }); */
    /* console.log(events) */
    /* console.log(events) */
    /* console.log(events) */
    events = [
        {
            "date": new Date("2020-09-21T04:15:30"),
            "description": "They can't Stop us all",
            "name": "Storm Area 51",
            "user": 7
        },
        {
            "date": new Date("2020-09-21T04:15:30"),
            "description": "They can't Stop us all",
            "name": "Storm Area 51",
            "user": 7
        },
        {
            "date": new Date("2020-09-21T04:15:30"),
            "description": "They can't Stop us all",
            "name": "Storm Area 51",
            "user": 7
        },
        {
            "date": new Date("2020-09-21T04:15:30"),
            "description": "They can't Stop us all",
            "name": "Storm Area 51",
            "user": 7
        },
        {
            "date": new Date("2020-09-21T04:15:30"),
            "description": "They can't Stop us all",
            "name": "Storm Area 51",
            "user": 7
        },
    ]

    function formatDate() {
        let months = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
        var days = ["Monday", "Tuesday", "Wendsday", "Thursday", "Friday", "Saturday", "Sunday"]
        
        return `${days[now.getDay()]} ${now.getDate()}, ${months[now.getMonth()]}.`
    }
</script>

<scrollView orientation="vertical">
    <stackLayout class="bg">
        <label class="h1 thin blue" text="Hello,"/>
        <flexboxLayout justifyContent="space-between" alignItems="center">
            <label class="h1 bold blue" text="Denzell"/>
            <label class="blue thin" text="{formatDate()}" />
        </flexboxLayout>
        {#each events as event, i}
            <Event big={i == 0} {...event} />
        {/each}
    </stackLayout>
</scrollView>

