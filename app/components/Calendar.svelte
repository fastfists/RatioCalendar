<script> 
    import Event from './Event.svelte';
    import { setup, user, getEvents } from '../utils';
    
    let events;
    setup();

    getEvents()
        .then(inEvents => {
            console.log("whooooo")
            console.log("whooooo")
            events = inEvents;
        })
        .catch(e => {
            console.log("yyikes")
            console.log(e);
        });
    console.log(events)

</script>

<style>
</style>

<scrollView orientation="vertical">
    <stackLayout class="calendar">
    </stackLayout>
</scrollView>
