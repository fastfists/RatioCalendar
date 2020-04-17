<script> 
    import Event from './Event.svelte';
    
    let props = {
        event_date: new Date('August 19, 1975 23:15:30'),
        event_name: "WWIII",
    };
</script>

<stackLayout>
    <Event { ...props } />
</stackLayout>


