<script> 
    import Event from './Event.svelte';
    
    let props = {
        date: new Date('August 19, 1975 23:15:30'),
        name: "WWIII",
    };
</script>

<stackLayout>
    <Event { ...props } />
</stackLayout>


