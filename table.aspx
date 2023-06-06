<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="table.aspx.cs" Inherits="table" %>

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
    <%-- For SearchPanes --%>
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.1.2/css/searchPanes.dataTables.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/select/1.6.2/css/select.dataTables.min.css"/>
    <%-- cdn for button --%>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css"/>
    <style>
        div.dt-buttons{
            width:100%;
        }
        button.dt-button{
            float:right;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- edit Personal Detail Modal -->
        <div class="modal fade" id="myModal1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Personal Detail</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <select class="country col-sm-10" id="country" runat="server" name="country">
                                    <option selected="selected" disabled="disabled" value="">Country</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="code col-sm-2" id="code" runat="server" name="code" placeholder="Code +" readonly="readonly" />
                                <input type="tel" id="contact" class="contact col-sm-8" placeholder="e.g. +1 702 123 4567" />
                            </div>

                            <div class="form-group">
                                <input type="email" id="email" class="email col-sm-10" placeholder="Enter Your Email..." />
                            </div>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" id="addData" class="btn btn-info" data-backdrop='static' data-dismiss="modal" data-toggle="modal">Add</button>
                        
                        <button type="reset" id="reset" class="btn btn-danger">Reset</button>
                    </div>

                </div>
            </div>
        </div>
        <form runat="server">
                <button type="button" id="json" class="btn btn-info">Export to JSON</button>
                <button type="button" id="excel" class="btn btn-success">Export to Excel</button>
            </form>
        <table class="table table-striped table-hover table-responsive" id="table">
            <thead>
                <tr>
                    <th></th>
                    <th>Actions</th>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Position</th>
                    <th>Business Arena</th>
                    <th>Employee</th>
                    <th>Skill</th>
                   <%-- <th>Add</th>--%>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
        </table>
        <button id="back" class="btn btn-secondary">Back</button>
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
     <%-- Imp for all buttons --%>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>

    <%-- For colVis multiLevel collections --%>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.colVis.min.js"></script>

   <%-- imp for excel button --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>

    <%-- imp for pdf button --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>

    <%-- imp for buttons display --%>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>

    <%-- imp for print button --%>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
    <%-- For SearchPanes --%>
    <script src="https://cdn.datatables.net/searchpanes/2.1.2/js/dataTables.searchPanes.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.6.2/js/dataTables.select.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#table").DataTable();
            loadDataFromDatabase();

            $.ajax({
                url: 'table.aspx',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $.each(data.d, function (index, value) {
                        $('#country').append($('<option>').text(value.country).attr('value', value.country_id));
                    });
                }
            });

            $('#table').on('click', 'tbody td.dt-control', function () {
                var tr = $(this).closest('tr');
                var row = $('#table').DataTable().row(tr);

                if (row.child.isShown()) {
                    row.child.hide();
                } else {
                    row.child(format(row.data())).show();
                }
            });
        })

        $("#json").on('click', function () {
            debugger
            window.location.href = "jsonConvert.aspx"
        })
        $("#excel").on('click', function () {
            debugger
            window.location.href = "excelConvert.aspx"
        })

        /*$('#table').on('click', '.edit', function () {
            debugger
            var tr = $(this).closest('tr');
            var table = $('#table').DataTable();
            data = table.row(tr).data();

            $("#fname").val(data['first_name']);
            $("#lname").val(data['last_name']);
            $("#dposition").val(data['position_name']);
            $("#arena").val(data['arena']);
            $("#skill").val(data['skills']);
            $("#street").val(data['street_name']);
            $("#date").val(data['date_of_birth']);
            $("#zipcode").val(data['zipcode']);
            $("#place").val(data['place']);
            $("#country").val(data['country']);
            $("#code").val(data['codes']);
            $("#contact").val(data['contact']);
            $("#email").val(data['email']);

            window.location.href = "/Form.aspx";
        });*/

        $('#table').on('click', '.edit', function () {
            debugger
            var tr = $(this).closest('tr');
            var table = $('#table').DataTable();
            var data = table.row(tr).data();
            localStorage.setItem('editData', JSON.stringify(data));
            window.location.href = "/Form.aspx";
        });

        $('#country').change(function () {
            debugger
            var countryId = $(this).val();
            populateCode(countryId)
        });

        function populateCode(countryId) {
            $("#code").val("");

            $.ajax({
                url: 'table.aspx/GetAddCodes',
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

        $("#reset").on('click', function () {
            clear();
        })

        function clear() {
            $("#country").val("");
            $("#code").val("");
            $("#contact").val("");
            $("#email").val("");
        }

        $("#back").on('click', function () {
            window.location.href = "/Form.aspx";
        })


        function format(d) {
            debugger
            return (
                '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:100px; margin: auto;">' +
                '<tr>' +
                '<th>Street</th>' +
                '<th>Zipcode</th>' +
                '<th>Place</th>' +
                '<th>Country</th>' +
                '</tr>' +
                '<tr>' +
                '<td><table border = "2" cellpadding = "4"> <tr><td>' + d.street_name + '</td></tr></table></td>' +
                '<td><table border = "2" cellpadding = "4"> <tr><td>' + d.zipcode + '</td></tr></table></td>' +
                '<td><table border = "2" cellpadding = "4"> <tr><td>' + d.place + '</td></tr></table></td>' +
                '<td><table border = "2" cellpadding = "4"> <tr><td>' + d.country + '</td></tr></table></td>' +
                '</tr>' +
                '</table>' +

                '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:100px; margin: auto;">' +
                '<tr>' +
                '<th>Phone No.:</th>' +
                '<th>Email</th>' +
                '</tr>' +
                '<tr>' +
                '<td><table border = "2" cellpadding = "4"> <tr><td>' + d.codes +'-'+ d.contact + '</td></tr></table></td>' +
                '<td><table border = "2" cellpadding = "4"> <tr><td>' + d.email + '</td></tr></table></td>' +
                '</tr>' +
                (d.contact1 ?
                    '<tr>' +
                    '<td>' + d.codes1 + '-' + d.contact1 + '</td>' +
                    '<td>' + d.email1 + '</td>' +
                    '</tr>' : '') +
                (d.contact2 ?
                    '<tr>' +
                    '<td>' + d.codes2 + '-' + d.contact2 + '</td>' +
                    '<td>' + d.email2 + '</td>' +
                    '</tr>' : '') +
                (d.contact3 ?
                    '<tr>' +
                    '<td>' + d.codes3 + '-' + d.contact3 + '</td>' +
                    '<td>' + d.email3 + '</td>' +
                    '</tr>' : '') +
                (d.contact4 ?
                    '<tr>' +
                    '<td>' + d.codes4 + '-' + d.contact4 + '</td>' +
                    '<td>' + d.email4 + '</td>' +
                    '</tr>' : '') +
                '</table>'
            );
        }

        function loadDataFromDatabase() {
            debugger
            $.ajax({
                type: 'POST',
                url: 'table.aspx/GetDataFromDatabase',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    debugger
                    var jsonData = JSON.parse(data.d);
                    $('#table').DataTable().clear().destroy();
                    var table = $('#table').DataTable({
                        data: jsonData,
                        dom: 'PBlfrtip',
                        buttons: [
                            {
                                text: 'Delete',
                                action: function (e, dt, node, config) {
                                    debugger
                                    var row = dt.rows({ selected: true });
                                    var count = dt.rows({ selected: true }).count()
                                    var data = row.data();
                                    var selectedRows = [];
                                    for (var i = 0; i < count; i++) {
                                        selectedRows.push(data[i]["pid"]);
                                        var ids = selectedRows.join(", ");
                                    }
                                    var table = $('#table').DataTable();
                                    Swal.fire({
                                        title: 'Are you sure?',
                                        text: "You won't be able to revert this!",
                                        icon: 'warning',
                                        showCancelButton: true,
                                        confirmButtonColor: '#3085d6',
                                        cancelButtonColor: '#d33',
                                        confirmButtonText: 'Yes, delete it!'
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            debugger
                                            $.ajax({
                                                type: 'POST',
                                                url: 'formJoins.aspx/DeleteData',
                                                data: JSON.stringify({ id: ids }),
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (data) {
                                                    debugger
                                                    Swal.fire(
                                                        'Deleted!',
                                                        'Your file has been deleted.',
                                                        'success'
                                                    );
                                                    loadDataFromDatabase();
                                                },
                                                error: function (xhr, textStatus, errorThrown) {
                                                    console.log(xhr.responseText);
                                                }
                                            });
                                        }
                                    });
                                },
                                enabled: false
                            },
                            {
                                extend: 'copyHtml5',
                                text: '<i class="fas fa-copy"></i> Copy',
                                titleAttr: 'Copy',
                                title: 'Employee Data',
                                footer: true,
                                exportOptions: {
                                    columns: [3, 4, 5, 6, 7, 8]
                                }
                            },
                            {
                                extend: 'excelHtml5',
                                text: '<i class="fas fa-file-excel"></i> Excel',
                                titleAttr: 'Excel',
                                title: 'Employee Data',
                                footer: true,
                                autoFilter: true,
                                sheetName: 'Exported data',
                                exportOptions: {
                                    columns: [3, 4, 5, 6, 7, 8]
                                }
                            },
                            {
                                extend: 'csvHtml5',
                                text: '<i class="fas fa-file-csv"></i> CSV',
                                titleAttr: 'CSV',
                                title: 'Employee Data',
                                footer: true,
                                exportOptions: {
                                    columns: [3, 4, 5, 6, 7, 8]
                                }
                            },
                            {
                                extend: 'pdfHtml5',
                                text: '<i class="fas fa-file-pdf"></i> PDF',
                                titleAttr: 'PDF',
                                title: 'Employee Data',
                                orientation: 'landscape',
                                footer: true,
                                exportOptions: {
                                    columns: [3, 4, 5, 6, 7, 8]
                                }
                            },
                            {
                                extend: 'print',
                                text: '<i class="fas fa-print"></i> Print',
                                titleAttr: 'Print',
                                title: 'Employee Data',
                                footer: true,
                                exportOptions: {
                                    columns: [3, 4, 5, 6, 7, 8]
                                }
                            }
                        ],
                        columns: [
                            {
                                data: null,
                                defaultContent: ''
                            },
                            {
                                className: 'dt-control',
                                orderable: false,
                                data: null,
                                defaultContent: '',
                            },
                            {
                                data: 'pid', visible: false
                            },
                            { data: 'title' },
                            {
                                data: null,
                                render: function (data, type, full, meta) {
                                    debugger
                                    var name = full.first_name + ' ' + full.last_name;
                                    return name;
                                },
                            },
                            { data: 'date_of_birth' },
                            { data: 'position_name' },
                            { data: 'arena' },
                            { data: 'employee_type' },
                            { data: 'skill' },
                            /*{
                                data: null,
                                render: function (data, type, full, meta) {
                                    return "<i class='fa-solid fa-plus add' data-toggle='modal' data-backdrop='static' data-target='#myModal1' style='color: #000000;'></i>";
                                }
                            },*/
                            {
                                data: null,
                                render: function (data, type, full, meta) {
                                    return "<i class='fa-solid fa-pen-to-square fa-lg edit' data-toggle='modal' data-backdrop='static' data-target='#myModal2' style='color: #00c703;'></i>";
                                }
                            },
                            {
                                data: null,
                                render: function (data, type, full, meta) {
                                    return "<i class='fa-solid fa-trash delete' style='color: #e60000;'></i>";
                                }
                            }

                        ],
                        columnDefs: [{
                            targets: 0,
                            orderable: false,
                            className: 'select-checkbox'
                        },
                        {
                            targets: 1,
                            orderable: false
                        },
                        {
                            searchPanes: {
                                show: true
                            },
                            targets: [3, 6, 7]
                        }
                        ],
                        select: {
                            style: 'multi',
                            selector: 'td:first-child'
                        },
                        order: [[1, 'asc']]

                    });
                    table.on('select deselect', function () {
                        var selectedRows = table.rows({ selected: true }).count();
                        table.button(0).enable(selectedRows >= 1);
                    });
                }
            });
        }

        $('#table').on('click', '.add', function () {
            debugger
            var tr = $(this).closest('tr');
            var table = $('#table').DataTable();
            var data = table.row(tr).data();
            var pid = data['pid'];

            $("#addData").off('click').on('click', function () {
                var code = $("#code").val();
                var contact = $("#contact").val();
                var email = $("#email").val();
                $.ajax({
                    type: 'POST',
                    url: 'table.aspx/AddContact',
                    data: JSON.stringify({ "pid": pid, "code": code, "contact": contact, "email": email }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        debugger
                        return ("success");
                        clear();
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            });
        });
        
        $('#table').on('click', '.delete', function () {
            debugger
            var table = $('#table').DataTable();
            var row = $(this).closest('tr');
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    debugger
                    var data = table.row(row).data();
                    $.ajax({
                        type: 'POST',
                        url: 'table.aspx/DeleteData',
                        data: JSON.stringify({ pid: data['pid'] }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            debugger
                            Swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            );
                            table.row(row).remove().draw();
                            loadDataFromDatabase();
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            console.log(xhr.responseText);
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
