<script>
    import { onMount } from 'svelte';
    import Timer from './Timer.svelte';
    export let date;
    export let name;
    export let description;

    function formatDate(in_date) {
        let months = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        return `${months[in_date.getMonth()]}, ${in_date.getDate()} ${in_date.getFullYear()}`;
    }
</script>

<style>
    .cal-event {
        color: black; 
        background-color: #376776;
        padding: 20px;
        border: 1px solid black;
    }
</style>

<dockLayout class="cal-event" stretchFirstChild="true">
    <stackLayout>
        <label class="p" text={formatDate(date)} />
        <label class="h2" text="{name}"/>
        <label class="p" text="{description}"/>
    </stackLayout>
    <Timer {date} />
</dockLayout>
