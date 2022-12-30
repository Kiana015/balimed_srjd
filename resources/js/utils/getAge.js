// dari stackoverflow
const getAge = (dateString) => {
  var now = new Date();
  // var today = new Date(now.getYear(),now.getMonth(),now.getDate());

  var yearNow = now.getYear();
  var monthNow = now.getMonth();
  var dateNow = now.getDate();

  // var dob = new Date(dateString.substring(6,10),
  //                    dateString.substring(0,2)-1,                   
  //                    dateString.substring(3,5)                  
  //                    );

  var dob = new Date(dateString);
  var yearDob = dob.getYear();
  var monthDob = dob.getMonth();
  var dateDob = dob.getDate();
  var age = {};
  var ageString = "";
  var yearString = "";
  var monthString = "";
  var dayString = "";

  var yearAge = ''
  yearAge = yearNow - yearDob;

  if (monthNow >= monthDob)
    var monthAge = monthNow - monthDob;
  else {
    yearAge--;
    var monthAge = 12 + monthNow -monthDob;
  }

  if (dateNow >= dateDob)
    var dateAge = dateNow - dateDob;
  else {
    monthAge--;
    var dateAge = 31 + dateNow - dateDob;

    if (monthAge < 0) {
      monthAge = 11;
      yearAge--;
    }
  }

  age = {
      tahun: yearAge,
      bulan: monthAge,
      hari: dateAge
      };

  if ( age.tahun > 1 ) yearString = " tahun";
  else yearString = " tahun";
  if ( age.bulan> 1 ) monthString = " bulan";
  else monthString = " bulan";
  if ( age.hari > 1 ) dayString = " hari";
  else dayString = " hari";

  if ( (age.tahun > 0) && (age.bulan > 0) && (age.hari > 0) )
    ageString = age.tahun + yearString + " " + age.bulan + monthString + " " + age.hari + dayString;
  else if ( (age.tahun == 0) && (age.bulan == 0) && (age.hari > 0) )
    ageString = age.hari + dayString;
  else if ( (age.tahun > 0) && (age.bulan == 0) && (age.hari == 0) )
    ageString = age.tahun + yearString;
  else if ( (age.tahun > 0) && (age.bulan > 0) && (age.hari == 0) )
    ageString = age.tahun + yearString + " " + age.bulan + monthString;
  else if ( (age.tahun == 0) && (age.bulan > 0) && (age.hari > 0) )
    ageString = age.bulan + monthString + " " + age.hari + dayString;
  else if ( (age.tahun > 0) && (age.bulan == 0) && (age.hari > 0) )
    ageString = age.tahun + yearString + " " + age.hari + dayString;
  else if ( (age.tahun == 0) && (age.bulan > 0) && (age.hari == 0) )
    ageString = age.bulan + monthString;
  else ageString = "-sdsds";

  return ageString;
}

export default getAge