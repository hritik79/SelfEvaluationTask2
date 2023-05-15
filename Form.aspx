<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <%-- Select 2 cdn --%>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

</head>
<body>

    <div class="container">
        <div sstyle="background-color:papayawhip">
            <form id="form1" runat="server" action="table.aspx">
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
                            <label class="form-check-label">Back End Developer</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input title" id="radio4" name="optradio" value="Database Analyst" />
                            <label class="form-check-label">Database Analyst</label>
                        </div>
                    </div>
                    <%-- name --%>
                    <div class="form-group">
                        <input type="text" id="fname" class="fname col-sm-5" placeholder="First name" /><span style="color: red;">*</span>
                        <input type="text" id="lname" class="lname col-sm-5" placeholder="Last name" /><span style="color: red;">*</span>
                    </div>
                    <%-- dropdown --%>
                    <div class="form-group">
                        <select class="dposition col-sm-10" name="dposition" id="dposition">
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
                        <select id="skill" class="skill-multiple col-sm-10 skill" multiple="multiple">
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
                        <input type="text" id="zipcode" class="zipcode col-sm-2" placeholder="Zipcode" />
                        <select class="place col-sm-8" id="place">
                            <option selected="selected" disabled="disabled" value="">Place</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="country col-sm-10" id="country">
                            <option selected="selected" disabled="disabled" value="">Country</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="code col-sm-2" id="code" placeholder="Code +" />
                        <input type="tel" id="contact" class="contact col-sm-8" placeholder="e.g. +1 702 123 4567" />
                    </div>

                    <div class="form-group">
                        <input type="email" id="email" class="email col-sm-10" placeholder="Enter Your Email..." />
                    </div>

                    <div class="form-group">
                        <input type="checkbox" id="terms" class="terms" />
                        <p class="col-sm-8">I do accept the Terms and Conditions of your site</p>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="submit" class="btn btn-success" disabled="disabled">Submit</button>
                        <button id="reset" class="btn btn-danger">Reset</button>
                    </div>
                </div>
        </form>
    </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <%-- Select2 cdn --%>

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script>
        $(document).ready(function () {
            $(".skill-multiple").select2({
                placeholder: "Select Skills"
            });

            $.ajax({
                url: "Form.aspx",
                datatype: "JSON",
                type: "POST",
                success: function (data) {
                    $.each(data, function (index, value) {
                        $("#dposition").append($('<option>').text(value.positions).attr('value', value.position_id))
                    })
                }
            }); 
        });

        $('#terms').click(function () {
            if ($(this).is(':checked')) {
                $('#submit').removeAttr('disabled');
            } else {
                $('#submit').attr('disabled', true);
            }
        });

        $("#reset").on('click', function () {
            ("#fname").val("");
            ("#lname").val("");
            ("#tposition").val("");
            ("#dposition").val("");
            ("#arena").val("");
            ("#skill").val("");
            ("#street").val("");
            ("#state").val("");
            ("#date").val("");
            ("#zipcode").val("");
            ("#country").val("");
            ("#code").val("");
            ("#email").val("");
            ("#terms").val("");
            $('.title').prop('checked', false);
            $('.employee').prop('checked', false);
        })

        $("#submit").on('click', function () {
            debugger
            var title = $('input[name="optradio"]:checked').val();
            var fname = ("#fname").val();
            var lname = ("#lname").val();
            var position = ("#dposition").val();
            var arena = ("#arena").val();
            var emp_type = $('input[name="optcheck"]:checked').val();
            var skill = $("#skill").select2("val").join(', ');
            var street = ("#street").val();
            var date = ("#date").val;
            var zipcode = ("#zipcode").val();
            var country = ("#country").val();
            var code = ("#code").val();
            var contact = ("#contact").val();
            var email = ("#email").val(); 

            jsonData = JSON.stringify({ "title": title, "fname": fname, "lname": lname, "position": position, "arena": arena, "emp_type": emp_type, "skill": skill, "street": street, "date": date, "zipcode": zipcode, "country": country, "code": code, "contact": contact, "email": email })

            $.ajax({
                url: 'Form.aspx/AddDataToDataBase',
                type:'POST',
                dataType: 'JSON',
                contentType: "application/json; charset=utf-8",
                data: jsonData,
                success: function (data) {
                    loadDataFromDatabase();
                }
            })
        })
    </script>
</body>
</html>
