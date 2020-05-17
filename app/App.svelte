<page>
    <actionBar title="Ratio Calendar" />

    <tabs tabsPosition="bottom">
        <tabStrip> 
            <tabStripItem title="Calendar" />
            <tabStripItem title="Settings" />
        </tabStrip> 

        <tabContentItem>
            <label text="Settings" />
        </tabContentItem>
        
        <tabContentItem>
            <label text="Settings" />
        </tabContentItem>
        
    </tabs>
</page>

<script>
    import { navigate } from 'svelte-native';
    let message = "Blank Svelte Native App";
    import Calendar from "./components/Calendar.svelte";
</script>

<style>
    .info .fas {
        color: #3A53FF;
    }
    .info {
        font-size: 20;
    }
</style>
