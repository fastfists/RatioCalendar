<script>
    import { onMount } from 'svelte';
    import Timer from './Timer.svelte';
	import EventDetail from './EventDetail.svelte'
	import { navigate } from 'svelte-native'
    export let date;
    export let name;
    export let description;
    export let big = false;


    function formatDate(in_date) {
        let months = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        return `${months[in_date.getMonth()]}, ${in_date.getDate()} ${in_date.getFullYear()}`;
    }

    function showDetails() {
        navigate({
            page: EventDetail,
            props: { date : date, name : name, description : description }
        })
    }
</script>

<style>
    .cal-event {
        color: black; 
        background-color: #C6C1CE;
        margin: 12 0;
        border-radius: 12;
        padding: 10 0;
    }

    .big {
        color: black; 
        background-color: #C6C1CE;
        margin: 6 0;
        border-radius: 12;
        padding: 12 0;
    }

    .big h1 {
        font-size: 50;
    }


</style>

<flexboxLayout class:big class="cal-event" alignItems="center" justifyContent="space-around"> 
    <stackLayout>
        <label class="p thin small" text={formatDate(date)} />
        <label class="h1 bold" text="{name}"/>
        <label class="p" text="{description}"/>
    </stackLayout>
    <stackLayout>
        <button text="Show more" on:swipe={ showDetails() } />
        <label text="Show more"} />
        <Timer  {date} />
    </stackLayout>
</flexboxLayout>
