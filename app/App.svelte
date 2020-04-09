<page>
    <actionBar title="Ratio Calcendar" />
    <gridLayout>
        <Calendar />
        <label class="info" horizontalAlignment="center" verticalAlignment="center" textWrap="true">
            <formattedString>
                <span class="fas" text="&#xf135;" />
                <span text=" {message}" />
            </formattedString>
        </label>
    </gridLayout>
</page>

<script>
    import Calendar from './Calendar.svelte';

    let message = "Blank Svelte Native App"
</script>

<style>
    .info .fas {
        color: #3A53FF;
    }
    .info {
        font-size: 20;
    }
</style>
