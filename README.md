
**BlocMetrics**

BlocMetrics is an analytics application which allows users to add their web apps and track data relating to them.

Javascript to add Blocmetrics to your web application:

var blocmetrics = {};
blocmetrics.report = function(eventName){
    var event = {event: { name: eventName }}

    var request = new XMLHttpRequest();

    request.open("POST", "http://localhost:3000/api/events", true);

    request.setRequestHeader('Content-Type', 'application/json');

    request.send(JSON.stringify(event));
}