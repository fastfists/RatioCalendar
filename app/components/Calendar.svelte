<script> 
    import Event from './Event.svelte';
    
    let props = {
        date: new Date('September 20, 2020 23:15:30'),
        name: "Storm Area 51",
        description: "They can't stop us all"
    };
</script>

<style>
.calendar {
    background-color: #000;
}
</style>

<stackLayout class="calendar">
    <Event { ...props } />
</stackLayout>


