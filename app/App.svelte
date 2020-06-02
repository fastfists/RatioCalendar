<page actionBarHidden=true>
    <tabs tabsPosition="bottom">

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

    TabStripItem {
        background-color: #97E2E2;
        color : #909090;
    }


    .info .fas {
        color: #3A53FF;
    }

    .info {
        font-size: 20;
    }

</style>

<script>
    import Calendar from "./components/Calendar.svelte";
    import Settings from "./components/Settings.svelte";
</script>

