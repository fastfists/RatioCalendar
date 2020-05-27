<script>

    import Timer from './Timer.svelte'
    export let date;
    export let name;
    export let description;

    function formatDate() {
        let months = ["January","February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        
        return `${months[date.getMonth()]} ${date.getDate()}, ${date.getFullYear()}`
    }

    function formatTime() {
        let hours = Math.abs(date.getHours() - 11); // getHours() is from 0-23
        let AM = (date.getHours() > 11)? "AM": "PM" 
        let minutes = date.getMinutes();
        return `${hours}:${minutes} ${AM} `
    }

    let dateString = formatDate() + "\r\n" + formatTime();

</script>

<style>
    .title {
        border: 5 solid #97E2E2;
    }
</style>

<page actionBarHidden=true>
    <stackLayout class="bg title">
        <label class="h1 white title" text="{name}" />
        <label class="text-muted" text="{dateString}"/>

        <label class="h1 white title" text="Description" />
        <label class="text-muted" text="{description}" />
    </stackLayout>
</page>
