<%@ Page language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%-- cdn for datatables --%>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
    <%-- cdn for datatable select --%>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" />
    <%-- cdn for datatable select --%>
    <link rel="stylesheet" href="https://cdn.datatables.net/select/1.6.2/css/select.dataTables.min.css" />
    <%-- cdn for bootstrap --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <%-- cdn for select2 --%>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</head>
<body>

    <div class="container">
        <div style="background-color: cadetblue; margin: 10px; padding: 10px;">
            <h1 class="display-4 text-center">Registration Form</h1>
        </div>
        <form id="form1" runat="server">
            <%-- Genreal Info div --%>
            <div class="geninfo col-sm-6" style="float: left">
                <h4 style="color: #0384fc">General Information</h4>
                <%-- radio --%>
                <div class="form-group">
                    <div class="form-check">
                        <input type="radio" class="form-check-input title" id="radio1" name="optradio" value="Full Stack Developer" />
                        <label class="form-check-label" for="radio1">Full Stack Developer</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input title" id="radio2" name="optradio" value="Front End Developer" />
                        <label class="form-check-label" for="radio2">Front End Developer</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input title" id="radio3" name="optradio" value="Back End Developer" />
                        <label class="form-check-label" for="radio3">Back End Developer</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input title" id="radio4" name="optradio" value="Database Analyst" />
                        <label class="form-check-label" for="radio4">Database Analyst</label>
                    </div>
                </div>
                <%-- name --%>
                <div class="form-group">
                    <input type="text" id="fname" class="fname col-sm-5" placeholder="First name" /><span style="color: red;">*</span>
                    <input type="text" id="lname" class="lname col-sm-5" placeholder="Last name" /><span style="color: red;">*</span>
                </div>
                <%-- dropdown --%>
                <div class="form-group">
                    <select class="dposition col-sm-10" runat="server" name="dposition" id="dposition">
                        <option selected="selected" disabled="disabled" value="">Select a position</option>
                    </select><span style="color: red;">*</span><br />
                    <br />
                    <input type="text" id="tposition" class="tposition col-sm-10" placeholder="Position" readonly="readonly" />
                </div>

                <div class="form-group">
                    <input type="text" class="arena col-sm-10" id="arena" placeholder="Business Arena" /><span style="color: red;">*</span>
                </div>
                <%-- check --%>
                <div class="form-group col-sm-3">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input employee" id="check1" name="optcheck" value="Employee" />
                        <label class="form-check-label" for="check1">Employee</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input employee" id="check2" name="optcheck" value="Employer" />
                        <label class="form-check-label" for="check2">Employer</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input employee" id="check3" name="optcheck" value="Admin" />
                        <label class="form-check-label" for="check3">Admin</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input employee" id="check4" name="optcheck" value="Developer" />
                        <label class="form-check-label" for="check4">Developer</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input employee" id="check5" name="optcheck" value="Advisor" />
                        <label class="form-check-label" for="check5">Advisor</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input employee" id="check6" name="optcheck" value="Trainer" />
                        <label class="form-check-label" for="check6">Trainer</label>
                    </div>
                </div>
                <div class="form-group">
                    <select id="skill" class="skill-multiple col-sm-10 skill" multiple="true" name="skill" runat="server">
                    </select><span style="color: red;">*</span>
                </div>
            </div>
            <%-- Contact info div --%>
            <div class="coninfo col-sm-6" style="float: right; color: white; background-color: #0384fc">
                <h4>Contact Information</h4>
                <div class="form-group">
                    <input type="text" class="street col-sm-10" id="street" placeholder="Street + Nr" /><br />

                </div>
                <div class="form-group">
                    <label for="date" class="col-sm-3">Date of Birth</label>
                    <input type="datetime-local" id="date" class="col-sm-6 date" />
                </div>
                <div class="form-group">
                    <input type="text" id="zipcode" maxlength="6" class="zipcode col-sm-2" placeholder="Zipcode" />
                    <select class="place col-sm-8" id="place" runat="server" name="place">
                        <option selected="selected" disabled="disabled" value="">Place</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="country col-sm-10" id="country" runat="server" name="country">
                        <option selected="selected" disabled="disabled" value="">Country</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="text" class="code col-sm-2" id="code" runat="server" name="code" placeholder="Code +" readonly="readonly" />
                    <input type="tel" id="contact" class="contact col-sm-8" maxlength="10" placeholder="e.g. +1 702 123 4567" />
                </div>

                <div class="form-group">
                    <input type="email" id="email" class="email col-sm-10" placeholder="Enter Your Email..." />
                </div>

                <div class="form-group">
                    <input type="checkbox" id="terms" class="terms" />
                    <p class="col-sm-8">I do accept the Terms and Conditions of your site</p>
                </div>
                <div class="form-group">
                    <button type="submit" id="submit" class="btn btn-success" disabled="disabled" runat="server">Submit</button>

                    <button type="button" id="update" class="btn btn-warning" disabled="disabled" style="display: none" runat="server">Update</button>

                    <button type="reset" id="reset" class="btn btn-danger">Reset</button><br />
                    <br />

                    <button type="button" id="stats" class="btn btn-secondary" runat="server">View Stats</button><br />
                    <br />
                </div>
            </div>
        </form>
    </div>
    <%-- jquery cdn --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <%-- Datatable cdn --%>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
    <%-- Datatable button cdn --%>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <%-- Datatable Select cdn --%>
    <script src="https://cdn.datatables.net/select/1.6.2/js/dataTables.select.min.js"></script>
    <%-- Bootstrap cdn --%>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <%-- CDN for Select2 --%>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <%-- CDN for sweetalert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <%-- CDN for fontawesome --%>
    <script src="https://kit.fontawesome.com/c13d76a6e1.js" crossorigin="anonymous"></script>

    <script>

        $(document).ready(function () {
            $(".skill-multiple").select2({
                placeholder: "Select Skills",
                allowClear: true
            });

            $.ajax({
                url: 'Form.aspx',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    $.each(data.d, function (index, value) {
                        $('#dposition').append($('<option>').text(value.position_name).attr('value', value.position_id));
                    });
                }
            });

            $.ajax({
                url: 'Form.aspx',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    $.each(data.d, function (index, value) {
                        $('#country').append($('<option>').text(value.country).attr('value', value.country_id));
                    });
                }
            });

            $.ajax({
                url: "Form.aspx",
                type: "POST",
                dataType: "json",
                success: function (data) {
                    var options = "";
                    for (var i = 0; i < data.length; i++) {
                        options += "<option value='" + data[i].skill_id + "'>" + data[i].skills + "</option>";
                    }
                    $("#skill").html(options);
                }
            });

            if (localStorage) { 
                editForm();
            }
        });

        /*$("#update").on('click', function () {
            window.location.href = "/table.aspx";
        })*/

        $("#stats").on('click', function () {
            window.location.href = "/table.aspx";
        })

        $("#submit").on('click', function () {
            debugger
            window.event.preventDefault();
            var fname = $("#fname").val();
            var lname = $("#lname").val();
            var position = $("#dposition").val();
            var arena = $("#arena").val();
            var emp_type = $("input[name='optcheck']:checked").map(function (_, el) {
                return $(el).val();
            }).get().join(",");
            var skill = $("#skill").select2("val");
            var street = $("#street").val();
            var date = $("#date").val();
            var zipcode = $("#zipcode").val();
            var place = $("#place").val();
            var country = $("#country").val();
            var code = $("#code").val();
            var contact = $("#contact").val();
            var email = $("#email").val(); 

            if ($(":input") == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter all field details!',
                });
            } else if (!$('.title').is(':checked')) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select any title .',
                });
                return false;
            } else if (fname == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter your first name!',
                });
            } else if (lname == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter your Last name!',
                });
            } else if (position == null) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter your Position!',
                });
            } else if (arena == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter Business arena!',
                });
            } else if (!$('.employee').is(':checked')) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select employee type!',
                });
                return false;
            } else if (skill == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select skills',
                });

            } else if (street == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter street',
                });

            } else if (date == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select date of birth.',
                });

            } else if (zipcode == '' || !$('#zipcode').val().match('[0-9]{6}')) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter zipcode.',
                });

            } else if (place == null) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select proper place!',
                });

            } else if (country == null) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please  select proper country!',
                });

            } else if (code == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter code!',
                });
            } else if (contact == '' || !$('#contact').val().match('[0-9]{10}')) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter correct 10 digit number!',
                });
            } else if (email == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter email!',
                });
            } else {
                var Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                })
                Toast.fire({
                    icon: 'success',
                    title: 'Form Submitted successfully'
                })
                addData();
            }
        });
        function editForm() {
            debugger
            var editData = localStorage.getItem('editData');

            editData = JSON.parse(editData);
            const title = editData.title;
            const emp = editData.employee_type;
            const myArray = emp.split(",");
            var skill1 = editData.skill;            

            $("input[type='radio'][value='" + title + "']").prop('checked', true);
            $("#fname").val(editData.first_name);
            $("#lname").val(editData.last_name);
            $("#dposition").val(editData.position_id);
            $("#tposition").val(editData.position_name);
            $("#arena").val(editData.arena);
            for (let i = 0; i < myArray.length; i++) {
                $("input[type='checkbox'][value='" + myArray[i] + "']").prop('checked', true);
            }
            $("#skill option").each(function () {
                for (var i = 0; i < skill1.length; i++) {
                    if ($(this).text() === skill1[i]) {
                        debugger;
                        $(this).prop('selected', true);
                        $("#skill").trigger('change');
                    }
                }
            });
            $("#street").val(editData.street_name);

            var givenValue = editData.date_of_birth;
            var parts = givenValue.split(' ');

            var timeParts = parts[1].split('.');
            var hours = parseInt(timeParts[0]);
            var minutes = parseInt(timeParts[1]);
            var ampm = timeParts[2];
            if (ampm === "PM" && hours !== 12) {
                hours += 12;
            } else if (ampm === "AM" && hours === 12) {
                hours = 0;
            }
            var formattedDateTime = parts[0] + "T" + hours.toString().padStart(2, '0') + ":" + minutes.toString().padStart(2, '0');

            $("#date").val(formattedDateTime);
            $("#zipcode").val(editData.zipcode);
            $("#country").val(editData.country_id);
            if ($("#country").val()) {
                $("#country").trigger("change");
                $("#place").val(editData.place);
            }
            $("#code").val(editData.codes);
            $("#contact").val(editData.contact);
            $("#email").val(editData.email);

            $("#submit").hide();
            $("#update").show();
        }
        
        $('#dposition').on('change', function () {
            debugger
            var position = $("#dposition option:selected").text();
            $("#tposition").val(position);
        })

        $('#country').change(function () {
            debugger
            var countryId = $(this).val();
            populatePlaces(countryId);
            populateCode(countryId)
        });

        function populateCode(countryId) {
            $("#code").val("");

            $.ajax({
                url: 'Form.aspx/GetCodes',
                type: 'POST',
                data: JSON.stringify({ countryId: countryId }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json', 
                success: function (response) {
                    debugger
                    var codes = response.d;
                    $("#code").val(codes);
                }
            })
        }

        function populatePlaces(countryId) {
            debugger
            $('#place').empty();
            $('#place').append('<option selected="selected" disabled="disabled" value="">Place</option>');

            $.ajax({
                url: 'Form.aspx/GetPlaces',
                type: 'POST',
                data: JSON.stringify({ countryId: countryId }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    debugger
                    $.each(response.d, function (index, place) {
                        $('#place').append('<option value="' + place.PlaceId + '">' + place.Country + '</option>');
                    });
                }
            });
        }

        $('#terms').click(function () {
            if ($(this).is(':checked')) {
                $('#submit').removeAttr('disabled');
            } else {
                $('#submit').attr('disabled', true);
            }
        });

        $("#reset").on('click', function () {
            clear();
            localStorage.removeItem('editData');
        })


        function clear() {
            debugger
            $('#submit').attr('disabled', true);
            $("#fname").val("");
            $("#lname").val("");
            $("#tposition").val("");
            $("#dposition").val("");
            $("#arena").val("");
            $("#skill").val(null).trigger('change');
            $("#street").val("");
            $("#state").val("");
            $("#date").val("");
            $("#zipcode").val("");
            $("#country").val("");
            $("#code").val("");
            $("#contact").val("");
            $("#email").val("");
            $("#terms").val("");
            $('.title').prop('checked', false);
            $('.employee').prop('checked', false);
        }

        function addData() {
            debugger
            var title = $('input[name="optradio"]:checked').val();
            var fname = $("#fname").val();
            var lname = $("#lname").val();
            var position = $("#dposition").val();
            var arena = $("#arena").val();
            var emp_type = $("input[name='optcheck']:checked").map(function (_, el) {
                return $(el).val();
            }).get().join(",");
            var skill = $("#skill").select2("val").join(', ');
            var street = $("#street").val();
            var date = $("#date").val();
            var zipcode = $("#zipcode").val();
            var place = $("#place").val();
            var country = $("#country").val();
            var code = $("#code").val();
            var contact = $("#contact").val();
            var email = $("#email").val(); 

            $.ajax({
                type: 'POST',
                url: 'Form.aspx/AddDataToDataBase',
                data: JSON.stringify({ "title": title, "fname": fname, "lname": lname, "position": position, "arena": arena, "emp_type": emp_type, "skill": skill, "street": street, "date": date, "zipcode": zipcode, "place": place, "country": country, "code": code, "contact": contact, "email": email }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger
                    return ("success");
                    clear();
                    window.location.href = "/table.aspx";
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }

        $('#terms').click(function () {
            if ($(this).is(':checked')) {
                $('#update').removeAttr('disabled');
            } else {
                $('#update').attr('disabled', true);
            }
        });

        $("#update").on('click', function () {
            debugger
            window.event.preventDefault();
            var fname = $("#fname").val();
            var lname = $("#lname").val();
            var position = $("#dposition").val();
            var arena = $("#arena").val();
            var emp_type = $("input[name='optcheck']:checked").map(function (_, el) {
                return $(el).val();
            }).get().join(",");
            var skill = $("#skill").select2("val");
            var street = $("#street").val();
            var date = $("#date").val();
            var zipcode = $("#zipcode").val();
            var place = $("#place").val();
            var country = $("#country").val();
            var code = $("#code").val();
            var contact = $("#contact").val();
            var email = $("#email").val();

            if ($(":input") == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter all field details!',
                });
            } else if (!$('.title').is(':checked')) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select any title .',
                });
                return false;
            } else if (fname == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter your first name!',
                });
            } else if (lname == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter your Last name!',
                });
            } else if (position == null) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter your Position!',
                });
            } else if (arena == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter Business arena!',
                });
            } else if (!$('.employee').is(':checked')) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select employee type!',
                });
                return false;
            } else if (skill == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select skills',
                });

            } else if (street == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter street',
                });

            } else if (date == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select date of birth.',
                });

            } else if (zipcode == '' || !$('#zipcode').val().match('[0-9]{6}')) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter zipcode.',
                });

            } else if (place == null) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select proper place!',
                });

            } else if (country == null) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please  select proper country!',
                });

            } else if (code == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter code!',
                });
            } else if (contact == '' || !$('#contact').val().match('[0-9]{10}')) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter correct 10 digit number!',
                });
            } else if (email == '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter email!',
                });
            } else {
                var Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                })
                Toast.fire({
                    icon: 'success',
                    title: 'Data Updated successfully'
                })
                UpdateData();
            }
        });

        function UpdateData() {
            debugger
            var editData = localStorage.getItem('editData');
            editData = JSON.parse(editData);
            var pid = editData.pid;
            var title = $('input[name="optradio"]:checked').val();
            var fname = $("#fname").val();
            var lname = $("#lname").val();
            var position = $("#dposition").val();
            var arena = $("#arena").val();
            var emp_type = $("input[name='optcheck']:checked").map(function (_, el) {
                return $(el).val();
            }).get().join(",");
            var skill = $("#skill").select2("val").join(', ');
            var street = $("#street").val();
            var date = $("#date").val();
            var zipcode = $("#zipcode").val();
            var place = $("#place").val();
            var country = $("#country").val();
            var code = $("#code").val();
            var contact = $("#contact").val();
            var email = $("#email").val();

            $.ajax({
                type: 'POST',
                url: 'Form.aspx/UpdateDataToDataBase',
                data: JSON.stringify({ "pid": pid, "title": title, "fname": fname, "lname": lname, "position": position, "arena": arena, "emp_type": emp_type, "skill": skill, "street": street, "date": date, "zipcode": zipcode, "place": place, "country": country, "code": code, "contact": contact, "email": email }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger
                    clear();
                    localStorage.removeItem('editData');
                    window.location.href = "/table.aspx";
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }
        
    </script>
</body>
</html>
