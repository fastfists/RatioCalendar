<script> 
    import Event from './Event.svelte';
    import { setup, user, getEvents } from '../utils';
    
    let events = [];


    getEvents()
    .then(inEvents => {
        events = inEvents;
        console.log("important stuff");
    })
    .catch(error => {
    });

</script>

<style>
</style>

<scrollView orientation="vertical">
    <stackLayout class="calendar">
        {#each events as event}
            <Event { ...event} />
        {/each}
    </stackLayout>
</scrollView>
