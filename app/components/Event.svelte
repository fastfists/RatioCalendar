<script>
    import { onMount } from 'svelte';
    import Timer from './Timer.svelte';
    export let date;
    export let name;
    export let description;
    export let big = false;

    function formatDate(in_date) {
        let months = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        return `${months[in_date.getMonth()]}, ${in_date.getDate()} ${in_date.getFullYear()}`;
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
        font-size: 20px;
    }
</style>

<flexboxLayout class:big class="cal-event" alignItems="center" justifyContent="space-around"> 
    <stackLayout flexGrow="100">
        <label class="p thin small" text={formatDate(date)} />
        <label class="h1 bold" text="{name}"/>
        <label class="p" text="{description}"/>
    </stackLayout>
    <Timer flexGrow="4" {date} />
</flexboxLayout>
