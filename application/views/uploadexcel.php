<div id="page_content">
    <div id="page_content_inner">
        <div class="md-card">
            <div class="md-card-content">
                <h3 class="heading_a">
                    Product Upload
                    <span class="sub-heading">Please upload excel file.</span>
                </h3>
                <div class="uk-grid">
                    <div class="uk-width-1-1">
                        <form id="UploadPersonFile" method="post" onsubmit="return false"
                              class="uk-form-stacked">
                            <div id="file_upload-drop" class="uk-file-upload">
                                <p class="uk-text">Drop file to upload</p>
                                <p class="uk-text-muted uk-text-small uk-margin-small-bottom">or</p>
                                <a class="uk-form-file md-btn">choose file
                                    <input type="file" name="FilePath" class="custom-file-input" id="inputGroupFile01">
                                </a>
                            </div>
                            <div id="file_upload-progressbar" class="uk-progress uk-hidden">
                                <div class="uk-progress-bar" style="width:0">0%</div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" id="btn-Add-File"
                                        class="btn btn-primary uk-float-left md-btn md-btn-flat md-btn-flat-primary">
                                    Submit
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="uk-width-1-1">
                        <div class="msg "></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#btn-Add-File').click(function () {
        getUploadXLS();
    });

    function getUploadXLS() {
        altair_helpers.content_preloader_show();
        var formData = new FormData($("#UploadPersonFile")[0]);
        $('.msg').html('');
        CallAjax('<?php echo base_url() . 'index.php/Products/uploadFile' ?>', formData, 'POST', function (res) {
            altair_helpers.content_preloader_hide();
            if (res != '') {
                var response = JSON.parse(res);
                try {
                    var myclass = '';
                    $.each(response, function (i, v) {
                        if (v.class == 'error') {
                            myclass = 'md-color-red-900';
                        } else if (v.class == 'success') {
                            myclass = 'md-color-green-900';
                        } else if (v.class == 'warning') {
                            myclass = 'md-color-yellow-900';
                        }
                        $('.msg').append('<p class="' + myclass + '">' + v.message + '</p>');
                    });

                } catch (e) {
                }
            }
        }, true);
    }
</script>