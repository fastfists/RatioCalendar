<script>
    export let date;
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

<style> 
    svg {
       -webkit-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }

    .circle_animation {
      stroke-dasharray: 440; /* this value is the pixel circumference of the circle */
      stroke-dashoffset: 440;
      transition: all 1s linear;
    }
</style>

<label text={time_string}/>
<svg width="160" height="160" xmlns="http://www.w3.org/2000/svg">
 <g>
  <circle id="circle" class="circle_animation" r="69.85699" cy="81" cx="81" stroke-width="8" stroke="#6fdb6f" fill="none"/>
 </g>
</svg>

