<page actionBarHidden=true>
    <tabs bind:selectedIndex={selectedTab} tabsPosition="bottom"> 
        <tabStrip>
            <tabStripItem>
                <label text="Calendar" />
                <image src="font://&#xf133" class="far"/>
            </tabStripItem>
            <tabStripItem>
                <label text="Settings" />
                <image src="font://&#xf013" class="fas"/>
            </tabStripItem>
        </tabStrip> 

        <tabContentItem>
            <Calendar />
        </tabContentItem>
        <tabContentItem>
            <Settings />
        </tabContentItem>
    </tabs>
</page>

<style>

</style>

<script>
    import Calendar from "./components/Calendar.svelte";
    import Settings from "./components/Settings.svelte";

    let selectedTab;
    
    console.log(selectedTab)
    $: (selectedTab) => {
        console.log(selectedTab)
    }
</script>

