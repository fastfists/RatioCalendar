<page>
    <actionBar title="Ratio Calendar" />
        <dockLayout stretchLastChild="true" backgroundColor="#3c495e">
        <label text="Dock" height="55" dock="bottom" backgroundColor="#fff" color="#000"/>
        <Calendar />
    </dockLayout>
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
