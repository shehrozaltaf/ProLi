<div id="page_content">
    <div id="page_content_inner">
        <h4 class="heading_a uk-margin-bottom">Products</h4>
        <div class="md-card uk-margin-medium-bottom">
            <div class="md-card-content">
                <div class="dt_colVis_buttons"></div>
                <table id="my_table_pro" class="uk-table uk-tab-responsive"   >
                    <thead>
                    <tr>
                        <th></th>
                        <th class="pname">SKU Code</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Short Description</th>
                        <th>Link</th>
                        <th>Price</th>
                        <th>Cost</th>
                        <th>Manufacturer</th>
                        <th>UPC</th>
                        <th>UPC Dev</th>
                        <th>Condition</th>
                        <th>Image Link</th>
                        <th>Category</th>
                        <th>Weight</th>
                        <th>Meta Title</th>
                        <th>Meta Description</th>
                    </tr>
                    </thead>

                    <tfoot>
                    <tr>
                        <th></th>
                        <th class="pname">SKU Code</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Short Description</th>
                        <th>Link</th>
                        <th>Price</th>
                        <th>Cost</th>
                        <th>Manufacturer</th>
                        <th>UPC</th>
                        <th>UPC Dev</th>
                        <th>Condition</th>
                        <th>Image Link</th>
                        <th>Category</th>
                        <th>Weight</th>
                        <th>Meta Title</th>
                        <th>Meta Description</th>
                    </tr>
                    </tfoot>

                    <tbody></tbody>
                </table>
            </div>
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
        data['isMaster']=0;
        var t = $("#my_table_pro"), a = t.prev(".dt_colVis_buttons");
        var dt = $('#my_table_pro').DataTable({
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
            columns: [
                {
                    "width": "3%",
                    "class": "details-control",
                    "orderable": false,
                    "data": null,
                    "defaultContent": ""
                },
                {"data": "sku_code", "class": "pname"},
                {"data": "productName"},
                {"data": "description"},
                {"data": "short_description"},
                {"data": "link"},
                {"data": "price"},
                {"data": "cost"},
                {"data": "manufacturer"},
                {"data": "upc"},
                {"data": "upc_dev"},
                {"data": "condition"},
                {"data": "image_link"},
                {"data": "category"},
                {"data": "weight"},
                {"data": "meta_title"},
                {"data": "meta_description"}
            ],
            order: [
                [1, 'desc']
            ],
            buttons: [{
                extend: "colvis", fade: 0
            },{
                extend: "copyHtml5",
                text: '<i class="uk-icon-files-o"></i> Copy',
                titleAttr: "Copy"
            }, {
                extend: "print",
                text: '<i class="uk-icon-print"></i> Print',
                titleAttr: "Print"
            }, {
                extend: "excelHtml5",
                text: '<i class="uk-icon-file-excel-o"></i> XLSX',
                titleAttr: ""
            }, {
                extend: "csvHtml5",
                text: '<i class="uk-icon-file-text-o"></i> CSV',
                titleAttr: "CSV"
            }, {extend: "pdfHtml5", text: '<i class="uk-icon-file-pdf-o"></i> PDF', titleAttr: "PDF"}]
        }).buttons().container().appendTo(a);
        // Array to track the ids of the details displayed rows
        // Array to track the ids of the details displayed rows
        var detailRows = [];

        $('#my_table_pro tbody').on('click', 'tr td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = dt.row(tr);
            var idx = $.inArray(tr.attr('id'), detailRows);
            if (row.child.isShown()) {
                tr.removeClass('details');
                row.child.hide();
                // Remove from the 'open' array
                detailRows.splice(idx, 1);
            } else {
                tr.addClass('details');
                row.child(format(row.data())).show();
                // Add to the 'open' array
                if (idx === -1) {
                    detailRows.push(tr.attr('id'));
                }
            }
        });
        // On each draw, loop over the `detailRows` array and show any child rows
        dt.on('draw', function () {
            $.each(detailRows, function (i, id) {
                $('#' + id + ' td.details-control').trigger('click');
            });
        });
        // /$('.buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel').addClass('btn');
    }
</script>