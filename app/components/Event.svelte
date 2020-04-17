<script>
    import Timer from './Timer.svelte';
    export let date;
    export let name;
    export let description;

    const months = ["JAN", "FEB", "MAR","APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
    function formatDate(in_date) {
        return `${months[in_date.getMonth()]}, ${in_date.getDate()} ${in_date.getFullYear()}`;
    }
    
    let date_now = Date.now();
    setTimeout(() => {date_now = Date.now()}, 1000 );

    $: timedelta = date - date_now;
</script>

<stackLayout orientation="horizontal">
    <stackLayout>
        <span text="{formatDate(date)}"/>
        <span text="{name}"/>
        <span text="What???" />
        <span text="{description}"/>
    </stackLayout>
    <Timer {timedelta}/>
</stackLayout>
