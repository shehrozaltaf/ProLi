<div id="page_content">
    <div id="page_content_inner">
        <h4 class="heading_a uk-margin-bottom">Products</h4>
        <div class="md-card uk-margin-medium-bottom">
            <div class="md-card-toolbar">
                <div class="md-card-toolbar-actions">
                    <div class="md-card-dropdown" data-uk-dropdown="{pos:'bottom-right'}" aria-haspopup="true"
                         aria-expanded="false">
                        <i class="md-icon material-icons"></i>
                        <div class="uk-dropdown uk-dropdown-bottom" aria-hidden="true" tabindex=""
                             style="min-width: 200px; top: 32px; left: -168px;">
                            <div class="dt_colVis_buttons"></div>
                        </div>
                    </div>
                </div>
                <h3 class="md-card-toolbar-heading-text">
                    Master Products
                </h3>
            </div>
            <div class="md-card-content">
                <table id="dt_tableExport_my" class="uk-table uk-tab-responsive">
                    <thead>
                    <tr>
                        <th><input name="select_all" value="1" id="example-select-all" type="checkbox"/></th>

                        <th class="pname">SKU Code</th>
                        <th>Product Name</th>
                        <!--                        <th>Description</th>-->
                        <!--                        <th>Short Description</th>-->
                        <!--                        <th>Link</th>-->
                        <th>Price</th>
                        <th>Cost</th>
                        <th>Manufacturer</th>
                        <!--  <th>UPC</th>
                          <th>UPC Dev</th>
                          <th>Condition</th>
                          <th>Image Link</th>
                          <th>Category</th>
                          <th>Weight</th>
                          <th>Meta Title</th>
                          <th>Meta Description</th>-->
                        <th>Action</th>
                    </tr>
                    </thead>

                    <tfoot>
                    <tr>
                        <th></th>

                        <th class="pname">SKU Code</th>
                        <th>Product Name</th>
                        <!--                        <th>Description</th>-->
                        <!--                        <th>Short Description</th>-->
                        <!--                        <th>Link</th>-->
                        <th>Price</th>
                        <th>Cost</th>
                        <th>Manufacturer</th>
                        <!--<th>UPC</th>
                        <th>UPC Dev</th>
                        <th>Condition</th>
                        <th>Image Link</th>
                        <th>Category</th>
                        <th>Weight</th>
                        <th>Meta Title</th>
                        <th>Meta Description</th>-->
                        <th>Action</th>
                    </tr>
                    </tfoot>

                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="uk-modal" id="deleteModal" aria-hidden="true" style="display: none; overflow-y: auto;">
    <div class="uk-modal-dialog" style="top: 97px;">
        <div class="uk-modal-header">
            <h3 class="uk-modal-title">Delete Project</h3>
            <input type="hidden" id="delete_idProduct" name="delete_idProduct" value="">
        </div>
        <div class="uk-grid" data-uk-grid-margin>
            <div class="uk-width-medium-1-1">
                <p>Are you sure, you want to delete this</p>
            </div>
        </div>


        <div class="uk-modal-footer uk-text-right">
            <button type="button" class="md-btn md-btn-flat uk-modal-close">Close</button>
            <button type="button" class="md-btn md-btn-flat md-btn-flat-primary" onclick="deleteProject()">
                Delete
            </button>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        getData();
    });

    function format(d) {
        var html = '<table id="myinnertable">' +
            '<thead>' +
            '<tr>' +
            '<th>SKU</th>' +
            '<th>Name</th>' +
            '</tr>' +
            '</thead>' +
            '<tbody>';
        $.each(d.data, function (i, v) {
            html += '<tr>' +
                '<td>' + v.sku_code + '</td>' +
                '<td>' + v.productName + '</td>' +
                '</tr>';
        });
        html += '</tbody></table>';
        return html;
    }

    function getData() {
        var data = {};
        data['isMaster'] = 1;
        var a = $(".dt_colVis_buttons");
        var table = $('#dt_tableExport_my').DataTable({
            destroy: true,
            processing: true,
            serverSide: true,
            lengthMenu: [25, 50, 75, 100],
            pageLength: 25,
            iDisplayLength: 25,
            // dom: 'Bfrtip',
            ajax: {
                "url": "<?php echo base_url() . 'index.php/Products/getData' ?>",
                "method": "GET",
                "data": data
            },
            'columnDefs': [{
                'targets': 0,
                'searchable': false,
                'orderable': false,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta) {
                    return '<input type="checkbox" name="id[]" value="' + $('<div/>').text(data).html() + '">';
                }
            }],
            columns: [
                {"data": ""},

                {"data": "sku_code", "class": "pname"},
                {"data": "productName"},
                // {"data": "description"},
                // {"data": "short_description"},
                // {"data": "link"},
                {"data": "price"},
                {"data": "cost"},
                {"data": "manufacturer"},
                /* {"data": "upc"},
                 {"data": "upc_dev"},
                 {"data": "condition"},
                 {"data": "image_link"},
                 {"data": "category"},
                 {"data": "weight"},
                 {"data": "meta_title"},
                 {"data": "meta_description"},*/
                {"data": "action"}
            ],
            order: [
                [1, 'desc']
            ],

        });

        // Handle click on "Select all" control
        $('#example-select-all').on('click', function () {
            // Check/uncheck all checkboxes in the table
            var rows = table.rows({'search': 'applied'}).nodes();
            $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });

        // Handle click on checkbox to set state of "Select all" control
        $('#dt_tableExport_my tbody').on('change', 'input[type="checkbox"]', function () {
            // If checkbox is not checked
            if (!this.checked) {
                var el = $('#example-select-all').get(0);
                // If "Select all" control is checked and has 'indeterminate' property
                if (el && el.checked && ('indeterminate' in el)) {
                    // Set visual state of "Select all" control
                    // as 'indeterminate'
                    el.indeterminate = true;
                }
            }
        });

        var buttons = new $.fn.dataTable.Buttons(table, {
            "buttons": [{
                "extend": "copyHtml5",
                "text": '<i class="uk-icon-files-o"></i> Copy',
                "titleAttr": "Copy"
            }, {
                "extend": "print",
                "text": '<i class="uk-icon-print"></i> Print',
                "titleAttr": "Print"
            }, {
                "extend": "excelHtml5",
                "text": '<i class="uk-icon-file-excel-o"></i> XLSX',
                "titleAttr": ""
            }, {
                "extend": "csvHtml5",
                "text": '<i class="uk-icon-file-text"></i> CSV',
                "titleAttr": "CSV"
            }, {"extend": "pdfHtml5", "text": '<i class="uk-icon-file-pdf-o"></i> PDF', titleAttr: "PDF"}]
        }).container().appendTo(a);
        altair_helpers.content_preloader_hide();
    }

    function getDelete(obj) {
        var id = $(obj).attr('data-idProduct');
        $('#delete_idProduct').val(id);
        showModal('deleteModal');
    }

    function deleteProject() {
        var flag = 0;
        var data = {};
        data['idProduct'] = $('#delete_idProduct').val();
        if (data['idProduct'] == '' || data['idProduct'] == undefined || data['idProduct'] == 0) {
            notificatonShow('Something went wrong, Try again', 'danger');
            flag = 1;
            return false;
        }
        if (flag === 0) {
            CallAjax('<?php echo base_url('index.php/Products/deleteData')?>', data, 'POST', function (res) {
                if (res == 1) {
                    notificatonShow('Successfully Deleted', 'success');
                    hideModal('deleteModal');
                    window.location.reload();
                } else {
                    notificatonShow('Something went wrong, Try again', 'danger');
                }
            });
        }
    }
</script>