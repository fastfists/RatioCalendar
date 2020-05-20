<page>
    <actionBar flat="true" title="Ratio Calendar" />

    <tabs tabsPosition="bottom">
        <tabStrip> 
            <tabStripItem title="Calendar" />
            <tabStripItem title="Settings" />
        </tabStrip> 

        <tabContentItem>
            <Calendar />
        </tabContentItem>
        
        <tabContentItem>
            <Settings />
        </tabContentItem>
        
    </tabs>
</page>

<script>
    import Calendar from "./components/Calendar.svelte";
    import Settings from "./components/Settings.svelte";
</script>

<style>
    .info .fas {
        color: #3A53FF;
    }
    .info {
        font-size: 20;
    }
</style>
