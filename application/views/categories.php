<div id="page_content">
    <div id="page_content_inner">
        <h3 class="heading_b uk-margin-medium-bottom">Categories</h3>

        <h4 class="heading_a">Categories</h4>
        <div class="uk-grid" data-uk-grid-margin>
            <div class="uk-width-1-1">
                <ul class="uk-nestable" data-uk-nestable>
                    <?php foreach ($getData as $data) { ?>
                        <li class="uk-nestable-item uk-collapsed">
                            <div class="uk-nestable-panel">
                                <div class="uk-nestable-toggle" data-nestable-action="toggle"></div>
                                <?php echo $data->cat_name ?>
                            </div>
                            <ul>
                                <?php foreach ($data->category_level2 as $data2) { ?>
                                    <li class="uk-nestable-item  uk-collapsed"
                                        onclick="loadData(this)"
                                        data-idlevel="2"
                                        data-id="<?php echo $data2->idCategory ?>">
                                        <div class="uk-nestable-panel">
                                            <div class="uk-nestable-toggle" data-nestable-action="toggle">

                                            </div>
                                            <?php echo $data2->cat_name ?>
                                        </div>
                                        <ul class="loadData uk-nestable-list"></ul>
                                    </li>
                                <?php } ?>
                            </ul>
                        </li>
                    <?php } ?>
                    <!--<li class="uk-nestable-item">
                        <div class="uk-nestable-panel">
                            <div class="uk-nestable-toggle" data-nestable-action="toggle"></div>
                            Item 3
                        </div>
                    </li>
                    <li class="uk-nestable-item">
                        <div class="uk-nestable-panel">
                            <div class="uk-nestable-toggle" data-nestable-action="toggle"></div>
                            Item 4
                        </div>
                    </li>-->
                </ul>
            </div>
        </div>

    </div>
</div>
<script>
    function loadData(obj) {
        var data = {};
        data['id'] = $(obj).attr('data-id');
        data['idlevel'] = 1 + parseInt($(obj).attr('data-idlevel'));
        console.log(data);
        if (data['id'] != '' && data['id'] != undefined) {
            altair_helpers.content_preloader_show();
            CallAjax('<?= base_url('index.php/Categories/getCategoriesData')?>', data, 'POST', function (res) {
                altair_helpers.content_preloader_hide();
                var html = '';
                if (res != '' && JSON.parse(res).length > 0) {
                    $(obj).removeAttr('onclick');
                    var response = JSON.parse(res);
                    try {
                        $.each(response, function (i, v) {
                            html += '<li class="uk-nestable-item  uk-parent uk-collapsed" ' +
                                'onclick="loadData(this)" ' +
                                'data-idlevel="' + data['idlevel'] + '"' +
                                'data-id="' + v.idCategory + '">' +
                                '<div class="uk-nestable-panel">' +
                                '<div class="uk-nestable-toggle" data-nestable-action="toggle">' +
                                '</div>'
                                + v.cat_name +
                                '</div>' +
                                '<ul class="loadData  uk-nestable-list">' +
                                '</ul>' +
                                '</li>';
                        });
                    } catch (e) {
                    }
                    $(obj).find('.loadData').html(html);
                }
            });
        }
    }
</script>