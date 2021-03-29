// Foursquare API Info
const clientId = 'SBDXPG21KZ0EUCHRHMT4F1C2DMWJN0DIMZFYEZ0DD2DWDVMJ';
const clientSecret = 'ZMNXMAAXU3RXWAO4KZIEEAWNLYDDFX5Q1NDKQM4BTA0L04ZD';
const url = 'https://api.foursquare.com/v2/venues/explore?near=';

// APIXU Info
const apiKey = '0e9a708986de4ada91430959182809 ';
const forecastUrl = 'https://www.codecademy.com/courses/intermediate-javascript-requests/projects/wanderlust?course_redirect=introduction-to-javascript';

// Page Elements
const $input = $('#city');
const $submit = $('#button');
const $destination = $('#destination');
const $container = $('.container');
const $venueDivs = [$("#venue1"), $("#venue2"), $("#venue3"), $("#venue4")];
const $weatherDivs = [$("#weather1"), $("#weather2"), $("#weather3"), $("#weather4")];
const weekDays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

// Add AJAX functions here:

////6.Turn getVenues() into an asynchronous function that returns a Promise.
const getVenues = async () => {

	//7.add a const called city. Save the value from the user's input field on the page with $input.val().
	const city = $input.val();

	//8.Add a const called urlToFetch. This string will contain the combined text of the entire request URL.
	//the API endpoint URL
	//the user's input city
	//a limit parameter with the number of venues you wish to return (use 10)
	//the client_id parameter and your client ID
	//the client_secret parameter and your client secret
    //the v (version) parameter and today's date in this format: YYYYMMDD
	const urlToFetch = url + city + '&limit=10&client_id=' + clientId + '&client_secret=' + clientSecret + '&v=20180401';

	//9 Add try/catch statements with empty code blocks.
	//10.In the catch code block, log the error to the console.
	//11.In the try code block, use fetch() to send a GET request to urlToFetch. await the response and save it to a variable called response using the const keyword.

	try{

	}catch (error) {console.log(error);}

}

const getForecast = () => {

}


// Render functions
const renderVenues = (venues) => {
  $venueDivs.forEach(($venue, index) => {
    // Add your code here:

    let venueContent = '';
    $venue.append(venueContent);
  });
  $destination.append(`<h2>${venues[0].location.city}</h2>`);
}

const renderForecast = (days) => {
  $weatherDivs.forEach(($day, index) => {
    // Add your code here:


    let weatherContent = '';
    $day.append(weatherContent);
  });
}

const executeSearch = () => {
  $venueDivs.forEach(venue => venue.empty());
  $weatherDivs.forEach(day => day.empty());
  $destination.empty();
  $container.css("visibility", "visible");
  getVenues()
  getForecast()
  return false;
}

$submit.click(executeSearch)
