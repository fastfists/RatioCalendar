<script> 
    import Event from './Event.svelte';
    import { setUp, user, getEvents } from '../utils';

    let events = [];

</script>

<style>
    .calendar {
        background-color: #000;
        color: #fff
    }

</style>

<scrollView orientation="vertical">
    <stackLayout class="calendar">
        {#each events as event}
            <Event { ...event} />
        {/each}
    </stackLayout>
</scrollView>
