var country_arr = new Array("AMV College of Accountancy", "College of Architecture", "College of Commerce and Business Administration", "College of Education", "College of Fine Arts and Design", "College of Nursing", "Institute of Information and Computing Sciences", "College of Rehabilitation Sciences", "College of Science", "College of Tourism and Hospitality Management", "Conservatory of Music", "Faculty of Arts and Letters", "Faculty of Engineering", "Faculty of Pharmacy", "Institute of Physical Education and Athletics", "Undergraduate");

// States
var s_a = new Array();
s_a[0] = "";
s_a[1] = "B.S. Accountancy|B.S. Management Accounting|B.S. Accounting Information System";
s_a[2] = "B.S. Architecture";
s_a[3] = "B.S. Business Administration|B.S. Entrepreneurship";
s_a[4] = "B.S. Nutrition and Dietetics|BEE Major in Pre-School Education|B.S. Food technology|Bachelor in Secondary Education|Bachelor in Library and Information Science|Bachelor of Early Childhood Education|Bachelor of Special Needs Education";
s_a[5] = "BFA Major in Advertising Arts|B.S. Interior Design|BFA Major in Painting|B.S. Industrial Design";
s_a[6] = "B.S. Nursing";
s_a[7] = "B.S. Information Technology|B.S. Computer Science|B.S. Information Systems";
s_a[8] = "B.S. Physical Therapy|B.S. Occupational Therapy|B.S. Speech - Language Pathology|Bachelor in Sports Science";
s_a[9] = "B.S. Biology|B.S. Microbiology|B.S. Applied Mathematics Major in Actuarial Science|B.S. Psychology|B.S. Applied Physics Major in Instrumentation|B.S. Chemistry";
s_a[10] = "B.S. Hotel and Restaurant Management|B.S. Travel Management|Bachelor of Science in Tourism Management Major in Travel Operation and Service Management |Bachelor of Science in Tourism Management Major in Recreation and Leisure Management|Bachelor of Science in Hospitality Management Major in Culinary Entrepreneurship|Bachelor of Science in Hospitality Management Major in Hospitality Leadership";
s_a[11] = "BACHELOR OF MUSIC IN PERFORMANCE|BACHELOR OF MUSIC IN MUSIC EDUCATION|BACHELOR OF MUSIC IN COMPOSITION|BACHELOR OF MUSIC IN MUSIC TECHNOLOGY|BACHELOR OF MUSIC IN MUSIC THEATER|BACHELOR OF MUSIC IN JAZZ  ";
s_a[12] = "AB English Language Studies|AB Sociology|AB Asian Studies|AB Communication Arts|AB Literature|AB Political Science|AB Behavioral Science|AB Journalism|AB Economics|AB History|AB Legal Management|AB Philosophy|B.A. CREATIVE WRITING";
s_a[13] = "BS Civil Engineering|BS Electrical Engineering|BS Electronics Engineering|BS Chemical Engineering|BS Industrial Engineering|BS Mechanical Engineering";
s_a[14] = "BS Medical Technology|BS Pharmacy|BS Biochemistry";
s_a[15] = "Bachelor of Physical Education - Sports and Wellness Management";
s_a[16] = "Senior High School|High School";


function populateStates(countryElementId, stateElementId) {

    var selectedCountryIndex = document.getElementById(countryElementId).selectedIndex;

    var stateElement = document.getElementById(stateElementId);

    stateElement.length = 0; // Fixed by Julian Woods
    stateElement.options[0] = new Option('------Select Program------', '');
    stateElement.selectedIndex = 0;

    var state_arr = s_a[selectedCountryIndex].split("|");

    for (var i = 0; i < state_arr.length; i++) {
        stateElement.options[stateElement.length] = new Option(state_arr[i], state_arr[i]);
    }
}

function populateCountries(countryElementId, stateElementId) {
    // given the id of the <select class="form-control"> tag as function argument, it inserts <option> tags
    var countryElement = document.getElementById(countryElementId);
    countryElement.length = 0;
    countryElement.options[0] = new Option('------Select Faculty------', '-1');
    countryElement.selectedIndex = 0;
    for (var i = 0; i < country_arr.length; i++) {
        countryElement.options[countryElement.length] = new Option(country_arr[i], country_arr[i]);
    }

    // Assigned all countries. Now assign event listener for the states.

    if (stateElementId) {
        countryElement.onchange = function () {
            populateStates(countryElementId, stateElementId);
        };
    }
}