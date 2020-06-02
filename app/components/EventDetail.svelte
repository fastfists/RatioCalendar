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
        return `${hours}:${minutes} ${AM}`
    }

    let dateString = formatDate()
    let timeString = formatTime()

</script>

<style>
    .title {
        text-decoration: underline;
    }
</style>

<page actionBarHidden=true>
    <stackLayout class="bg">
    <flexBoxLayout flexDirection="column"
                justifyContent="space-around">
            <label class="h1 white title" text="{name}" />
            <label class="text-muted" text="{dateString}"/>
            <label class="text-muted" text="{timeString + " CST"}"/>
            <Timer class="text-muted" color="#AAAAAA" date={date}/>
        </flexBoxLayout>
        

        <label class="h1 white title" text="Description" />
        <label class="text-muted" text="{description}" />
    </stackLayout>
</page>
