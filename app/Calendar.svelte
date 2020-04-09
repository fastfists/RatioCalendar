<script>
    import { onMount } from 'svelte';
    import { gapi } from './google.js';

    let isSignedIn = false;

    onMount( () => {
        handleClientLoad();
    });

    $ : if (isSignedIn) {
        gapi.client.calendar.events.list({
            'calendarId': 'primary',
            'timeMin': (new Date()).toISOString(),
            'showDeleted': false,
            'singleEvents': true,
            'maxResults': 10,
            'orderBy': 'startTime'
        }).then(function(response) {
            var events = response.result.items;
            appendPre('Upcoming events:');

            if (events.length > 0) {
                for (i = 0; i < events.length; i++) {
                    var event = events[i];
                    var when = event.start.dateTime;
                    if (!when) {
                        when = event.start.date;
                    }
                    appendPre(event.summary + ' (' + when + ')')
                }
            } else {
                appendPre('No upcoming events found.');
            }
        });
    }
    
    function LogInOut() {
        if (isSignedIn) { 
            getAuthInstance().signOut();
        } else {
            getAuthInstance().signOut();
        }
    }

    function getAuthInstance() {
        return gapi.auth2.getAuthInstance()
    }

    function handleClientLoad() {
        gapi.load('client:auth2', initClient);
    }

    function initClient() {
        let client_id = "912756525927-epr6cf445mii33j72c3qp9nlkmgupdr6.apps.googleusercontent.com"
        let api_key = 'AIzaSyDQ2fVLQL649JpcZN53nu8tYc5yxAbbPfQ';
        let discovery_docs = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];
        let scopes = "https://www.googleapis.com/auth/calendar.readonly";

        gapi.client.init({
            apiKey: api_key,
            clientId: client_id,
            discorverydocs:discovery_docs,
            scope: scopes
        }).then( function () {
            getAuthInstance().isSingedIn.listen( (signedIn) => {
                    isSignedIn = signedIn;
                });
        }, function(error) {
            console.log(error);
            appendPre(JSON.stringify(error, null, 2));
        });

    }

    function appendPre(message) {
        var pre = document.getElementById('content');
        var textContent = document.createTextNode(message + '\n');
        pre.appendChild(textContent);
    }

</script>

<span> hello World </span>

<pre id="content"> </pre>

<button on:click={LogInOut}>
    Is logged in? {isSignedIn}
</button>



