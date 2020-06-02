<script>
    export let date;
    export let color;

    let time_string;
    updateTime();

    function formatTime(timedelta) {
        let days = Math.floor(timedelta / (1000 * 60 * 60 * 24));
        let hours = Math.floor((timedelta % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        let minutes = Math.floor((timedelta % (1000 * 60 * 60)) / (1000 * 60));
        let seconds = Math.floor((timedelta % (1000 * 60)) / 1000);
        return `${days} days ${hours}:${minutes}:${seconds}`;
    }

    function updateTime(){
        let timedelta = date - Date.now();
        time_string = formatTime(timedelta);

        if (timedelta == 0) {      
            clearInterval(interval);
            return;
        }
        //$('.circle_animation').css('stroke-dashoffset', ((i+1)*(initialOffset/time)));
    }

    let initialOffset = '440';
    let inerval = setInterval(() => {updateTime()}, 1000 );
</script>

<label style="color :{color}" text={time_string}/>
