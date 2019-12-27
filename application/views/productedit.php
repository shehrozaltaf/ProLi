<?php if (isset($editProduct) && isset($editProduct[0]) && $editProduct != '') {
    $data = $editProduct[0];
} else {
    $data = '';
} ?>
<style>
    .md-input-wrapper > label {
        color: #000d58;
    }
</style>
<div id="page_content">
    <div id="page_heading" data-uk-sticky="{ top: 48, media: 960 }">


        <h1 id="product_edit_name">
            <?php echo(isset($data->productName) && $data->productName != '' ? $data->productName : '') ?>
        </h1>
        <span class="uk-text-muted uk-text-upper uk-text-small"
              id="product_edit_sn"><?php echo(isset($data->sku_code) && $data->sku_code != '' ? $data->sku_code : '') ?></span>
    </div>
    <div id="page_content_inner">
        <form action="#" class="uk-form-stacked" id="product_edit_form">
            <div class="uk-grid uk-grid-medium" data-uk-grid-margin>
                <div class="uk-width-xLarge-2-10 uk-width-large-3-10">
                    <div class="md-card">
                        <div class="md-card-content">
                            <div class="uk-float-right">
                                <input type="checkbox" data-switchery
                                    <?php echo(isset($data->product_stats) && $data->product_stats == 'Y' ? ' checked ' : '') ?>
                                       name="product_edit_active_control"
                                       id="product_edit_active_control"/>
                            </div>
                            <label class="uk-display-block uk-margin-small-top"
                                   for="product_edit_active_control">Status</label>
                        </div>

                        <div class="md-card-content">
                            <div class="uk-float-right">
                                <input type="checkbox" data-switchery
                                    <?php echo(isset($data->isMaster) && $data->isMaster == '1' ? ' checked ' : '') ?>
                                       name="product_edit_active_control"
                                       id="product_edit_active_control"/>
                            </div>
                            <label class="uk-display-block uk-margin-small-top"
                                   for="product_edit_active_control">Master</label>
                        </div>
                    </div>
                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <div class="md-card-toolbar-actions">
                                <i class="md-icon material-icons">&#xE146;</i>
                            </div>
                            <h3 class="md-card-toolbar-heading-text">
                                Photos
                            </h3>
                        </div>

                        <div class="md-card-content">
                            <div class="uk-margin-bottom uk-text-center uk-position-relative">
                                <button type="button"
                                        class="uk-modal-close uk-close uk-close-alt uk-position-absolute"></button>
                                <img src=" <?php echo(isset($data->image_link) && $data->image_link != '' ? $data->image_link : '') ?>"
                                     alt="" class="img_medium"/>
                            </div>
                            <!--<ul class="uk-grid uk-grid-width-small-1-3 uk-text-center" data-uk-grid-margin>
                                <li class="uk-position-relative">
                                    <button type="button"
                                            class="uk-modal-close uk-close uk-close-alt uk-position-absolute"></button>
                                    <img src="assets/img/ecommerce/s6_edge_1.jpg" alt="" class="img_small"/>
                                </li>
                                <li class="uk-position-relative">
                                    <button type="button"
                                            class="uk-modal-close uk-close uk-close-alt uk-position-absolute"></button>
                                    <img src="assets/img/ecommerce/s6_edge_2.jpg" alt="" class="img_small"/>
                                </li>
                                <li class="uk-position-relative">
                                    <button type="button"
                                            class="uk-modal-close uk-close uk-close-alt uk-position-absolute"></button>
                                    <img src="assets/img/ecommerce/s6_edge_3.jpg" alt="" class="img_small"/>
                                </li>
                            </ul>-->
                        </div>
                    </div>
                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <h3 class="md-card-toolbar-heading-text">
                                Data
                            </h3>
                        </div>

                        <div class="md-card-content">

                            <div class="uk-form-row">
                                <div class="uk-input-group">
                                        <span class="uk-input-group-addon">
                                            <i class="uk-icon-usd"></i>
                                        </span>
                                    <label for="product_edit_price_control">Price</label>
                                    <input type="text" class="md-input" name="product_edit_price_control"
                                           id="product_edit_price_control"
                                           value="<?php echo(isset($data->price) && $data->price != '' ? $data->price : '') ?>"/>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <div class="uk-input-group">
                                    <span class="uk-input-group-addon"><i class="uk-icon-usd"></i></span>
                                    <label for="product_edit_tax_control">Cost</label>
                                    <input type="text" class="md-input" name="product_edit_tax_control"
                                           id="product_edit_tax_control"
                                           value="<?php echo(isset($data->cost) && $data->cost != '' ? $data->cost : '') ?>"/>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <div class="uk-input-group">
                                    <span class="uk-input-group-addon"><i class="material-icons">note</i></span>
                                    <label for="product_edit_tax_control">upc</label>
                                    <input type="text" class="md-input" name="product_edit_tax_control"
                                           id="product_edit_tax_control"
                                           value="<?php echo(isset($data->upc) && $data->upc != '' ? $data->upc : '') ?>"/>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <div class="uk-input-group">
                                    <span class="uk-input-group-addon"><i class="material-icons">note-o</i></span>
                                    <label for="product_edit_tax_control">upc_dev</label>
                                    <input type="text" class="md-input" name="product_edit_tax_control"
                                           id="product_edit_tax_control"
                                           value="<?php echo(isset($data->upc_dev) && $data->upc_dev != '' ? $data->upc_dev : '') ?>"/>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <div class="uk-input-group">
                                    <span class="uk-input-group-addon"><i class="material-icons">devices</i></span>
                                    <label for="product_edit_tax_control">condition</label>
                                    <input type="text" class="md-input" name="product_edit_tax_control"
                                           id="product_edit_tax_control"
                                           value="<?php echo(isset($data->condition) && $data->condition != '' ? $data->condition : '') ?>"/>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <div class="uk-input-group">
                                    <span class="uk-input-group-addon"><i class="uk-icon-arrow-up"></i></span>
                                    <label for="product_edit_tax_control">weight</label>
                                    <input type="text" class="md-input" name="product_edit_tax_control"
                                           id="product_edit_tax_control"
                                           value="<?php echo(isset($data->weight) && $data->weight != '' ? $data->weight : '') ?>"/>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="uk-width-xLarge-8-10  uk-width-large-7-10">
                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <h3 class="md-card-toolbar-heading-text">
                                Details
                            </h3>
                        </div>
                        <div class="md-card-content large-padding">
                            <div class="uk-grid uk-grid-divider uk-grid-medium" data-uk-grid-margin>
                                <div class="uk-width-large-1-2">
                                    <div class="uk-form-row">
                                        <label for="product_edit_manufacturer_control">SKU Code</label>
                                        <input type="text" class="md-input" id="product_edit_manufacturer_control"
                                               name="product_edit_manufacturer_control"
                                               value="<?php echo(isset($data->sku_code) && $data->sku_code != '' ? $data->sku_code : '') ?>"/>
                                    </div>
                                    <div class="uk-form-row">
                                        <label for="product_edit_name_control">Product Name</label>
                                        <input type="text" class="md-input" id="product_edit_name_control"
                                               name="product_edit_name_control"
                                               value="<?php echo(isset($data->productName) && $data->productName != '' ? $data->productName : '') ?>"/>
                                    </div>
                                    <div class="uk-form-row">
                                        <label for="product_edit_name_control">Manufacturer</label>
                                        <input type="text" class="md-input" id="product_edit_name_control"
                                               name="product_edit_name_control"
                                               value="<?php echo(isset($data->manufacturer) && $data->manufacturer != '' ? $data->manufacturer : '') ?>"/>
                                    </div>
                                    <div class="uk-form-row">
                                        <label for="product_edit_memory_control" class="uk-form-label">Short
                                            Description</label>
                                        <textarea class="md-input" name="product_edit_description_control"
                                                  id="product_edit_description_control" cols="30"
                                                  rows="4"><?php echo(isset($data->short_description) && $data->short_description != '' ? $data->short_description : '') ?>
                                        </textarea>
                                    </div>

                                </div><!-- <div class="uk-form-row">
                                        <label for="product_edit_color_control" class="uk-form-label">Color</label>
                                        <select id="product_edit_color_control" name="product_edit_color_control"
                                                data-md-selectize>
                                            <option value="white">White</option>
                                            <option value="black" selected>Black</option>
                                            <option value="red">Red</option>
                                        </select>
                                    </div>-->
                                <div class="uk-width-large-1-2">
                                    <!-- <div class="uk-form-row">
                                         <label class="uk-form-label" for="product_edit_tags_control">Tags</label>
                                         <select id="product_edit_tags_control" name="product_edit_tags_control"
                                                 multiple>
                                             <option value="lte" selected>LTE</option>
                                             <option value="quad_hd" selected>Quad HD</option>
                                             <option value="android_5" selected>Android™ 5.0</option>
                                             <option value="64gb" selected>64GB</option>
                                         </select>
                                     </div>-->
                                    <div class="uk-form-row">
                                        <label for="product_edit_description_control">Description</label>
                                        <textarea class="md-input" name="product_edit_description_control"
                                                  id="product_edit_description_control" cols="30"
                                                  rows="10"><?php echo(isset($data->description) && $data->description != '' ? $data->description : '') ?>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <h3 class="md-card-toolbar-heading-text">
                                Category
                            </h3>
                        </div>
                        <div class="md-card-content">
                            <div class="uk-grid" data-uk-grid-margin>
                                <div class="uk-width-large-1-1">
                                    <div class="uk-form-row">
                                        <label for="cc">Category One</label>
                                        <select id="cc" name="cc" class="md-input">
                                            <?php foreach ($getCategories as $category) { ?>
                                                <option value="<?php echo $category->idCategory ?>"
                                                    <?php echo(isset($category->idCategory) && $category->idCategory == $data->level_one ? 'selected' : '') ?>>
                                                    <?php echo $category->cat_name ?></option>
                                            <?php } ?>
                                        </select>
                                    </div> <?php
                                    if (isset($data->level_two) && $data->level_two != '' && $data->level_two != 0) { ?>
                                        <div class="uk-form-row">
                                            <label for="cc">Category Two</label>
                                            <select id="cc" name="cc" class="md-input">
                                                <option value="<?php echo $data->level_two ?>" selected>
                                                    <?php echo $data->categorytwo ?></option>
                                            </select>
                                        </div>   <?php }
                                    if (isset($data->level_three) && $data->level_three != '' && $data->level_three != 0) { ?>
                                        <div class="uk-form-row">
                                            <label for="cc">Category Three</label>
                                            <select id="cc" name="cc" class="md-input">
                                                <option value="<?php echo $data->level_three ?>" selected>
                                                    <?php echo $data->categorythree ?></option>
                                            </select>
                                        </div>
                                    <?php }
                                    if (isset($data->level_four) && $data->level_four != '' && $data->level_four != 0) { ?>
                                        <div class="uk-form-row">
                                            <label for="cc">Category Four</label>
                                            <select id="cc" name="cc" class="md-input">
                                                <option value="<?php echo $data->level_four ?>" selected>
                                                    <?php echo $data->categoryfour ?></option>
                                            </select>
                                        </div>
                                    <?php }
                                    if (isset($data->level_five) && $data->level_five != '' && $data->level_five != 0) { ?>
                                        <div class="uk-form-row">
                                            <label for="cc">Category Five</label>
                                            <select id="cc" name="cc" class="md-input">
                                                <option value="<?php echo $data->level_five ?>" selected>
                                                    <?php echo $data->categoryfive ?></option>
                                            </select>
                                        </div>   <?php }
                                    if (isset($data->level_six) && $data->level_six != '' && $data->level_six != 0) { ?>
                                        <div class="uk-form-row">
                                            <label for="cc">Category Six</label>
                                            <select id="cc" name="cc" class="md-input">
                                                <option value="<?php echo $data->level_six ?>" selected>
                                                    <?php echo $data->categorysix ?></option>
                                            </select>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--    <div class="md-card">
                            <div class="md-card-toolbar">
                                <h3 class="md-card-toolbar-heading-text">
                                    Attributes/Options
                                </h3>
                            </div>
                            <div class="md-card-content">
                                <div class="uk-grid" data-uk-grid-margin>
                                    <div class="uk-width-medium-2-10">
                                        <span class="uk-display-block uk-margin-small-top uk-text-large">Colors <a href="#"><i
                                                        class="material-icons uk-text-primary">&#xE5CD;</i></a></span>

                                    </div>
                                    <div class="uk-width-medium-8-10">
                                        <div class="uk-overflow-container">
                                            <table class="uk-table">
                                                <thead>
                                                <tr>
                                                    <th class="uk-width-4-10 uk-text-nowrap">Color</th>
                                                    <th class="uk-width-2-10 uk-text-center uk-text-nowrap">In stock</th>
                                                    <th class="uk-width-2-10 uk-text-center uk-text-nowrap">Price</th>
                                                    <th class="uk-width-2-10 uk-text-right uk-text-nowrap">Action</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="form_section">
                                                    <td></td>
                                                    <td class="uk-text-center uk-text-middle"><input type="checkbox"
                                                                                                     data-md-icheck
                                                                                                     checked/></td>
                                                    <td>
                                                        <div class="uk-input-group">
                                                                    <span class="uk-input-group-addon">
                                                                        <i class="uk-icon-usd"></i>
                                                                    </span>
                                                            <input type="text"
                                                                   class="md-input md-input-width-small uk-text-right"
                                                                   value="0.00"/>
                                                        </div>
                                                    </td>
                                                    <td class="uk-text-right uk-text-middle"><a href="#"
                                                                                                class="btnSectionRemove"><i
                                                                    class="material-icons md-24">&#xE872;</i></a></td>
                                                </tr>
                                                <tr class="form_section">
                                                    <td><input type="text" class="md-input md-input-width-medium"
                                                               value="White"/></td>
                                                    <td class="uk-text-center uk-text-middle"><input type="checkbox"
                                                                                                     data-md-icheck/></td>
                                                    <td>
                                                        <div class="uk-input-group">
                                                                    <span class="uk-input-group-addon">
                                                                        <i class="uk-icon-usd"></i>
                                                                    </span>
                                                            <input type="text"
                                                                   class="md-input md-input-width-small uk-text-right"
                                                                   value="+ 25.00"/>
                                                        </div>
                                                    </td>
                                                    <td class="uk-text-right uk-text-middle"><a href="#"
                                                                                                class="btnSectionRemove"><i
                                                                    class="material-icons md-24">&#xE872;</i></a></td>
                                                </tr>
                                                <tr class="form_section">
                                                    <td><input type="text" class="md-input md-input-width-medium"
                                                               value="Red"/></td>
                                                    <td class="uk-text-center uk-text-middle"><input type="checkbox"
                                                                                                     data-md-icheck
                                                                                                     checked/></td>
                                                    <td class="uk-text-nowrap uk-text-middle">
                                                        <div class="uk-input-group">
                                                                    <span class="uk-input-group-addon">
                                                                        <i class="uk-icon-usd"></i>
                                                                    </span>
                                                            <input type="text"
                                                                   class="md-input md-input-width-small uk-text-right"
                                                                   value="- 10.00"/>
                                                        </div>
                                                    </td>
                                                    <td class="uk-text-right uk-text-middle"><a href="#"
                                                                                                class="btnSectionRemove"><i
                                                                    class="material-icons md-24">&#xE872;</i></a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" class="uk-padding-remove">
                                                        <table class="uk-table"
                                                               data-dynamic-fields="field_template_a"></table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <script id="field_template_a" type="text/x-handlebars-template">
                                                <tr class="form_section">
                                                    <td class="uk-width-4-10"><input type="text"
                                                                                     class="md-input md-input-width-medium"
                                                                                     placeholder="Color"/></td>
                                                    <td class="uk-width-2-10 uk-text-middle uk-text-center"><input
                                                                type="checkbox" data-md-icheck/></td>
                                                    <td class="uk-width-2-10">
                                                        <div class="uk-input-group">
                                                                <span class="uk-input-group-addon">
                                                                    <i class="uk-icon-usd"></i>
                                                                </span>
                                                            <input type="text"
                                                                   class="md-input md-input-width-small uk-text-right"
                                                                   placeholder="Price"/>
                                                        </div>
                                                    </td>
                                                    <td class="uk-width-2-10 uk-text-right uk-text-middle">
                                                        <a href="#" class="btnSectionClone"><i class="material-icons md-24">&#xE145;</i></a>
                                                    </td>
                                                </tr>
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <div class="uk-grid" data-uk-grid-margin>
                                    <div class="uk-width-medium-2-10">
                                        <span class="uk-display-block uk-margin-small-top uk-text-large">Internal memory <a
                                                    href="#"><i
                                                        class="material-icons uk-text-primary">&#xE5CD;</i></a></span>
                                    </div>
                                    <div class="uk-width-medium-8-10">
                                        <div class="uk-overflow-container">
                                            <table class="uk-table">
                                                <thead>
                                                <tr>
                                                    <th class="uk-width-4-10 uk-text-nowrap">Memory</th>
                                                    <th class="uk-width-2-10 uk-text-center uk-text-nowrap">In stock</th>
                                                    <th class="uk-width-2-10 uk-text-center uk-text-nowrap">Price</th>
                                                    <th class="uk-width-2-10 uk-text-right uk-text-nowrap">Action</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="form_section">
                                                    <td><input type="text" class="md-input md-input-width-medium"
                                                               value="32GB"/></td>
                                                    <td class="uk-text-middle uk-text-center"><input type="checkbox"
                                                                                                     data-md-icheck/></td>
                                                    <td>
                                                        <div class="uk-input-group">
                                                                    <span class="uk-input-group-addon">
                                                                        <i class="uk-icon-usd"></i>
                                                                    </span>
                                                            <input type="text"
                                                                   class="md-input md-input-width-small uk-text-right"
                                                                   value="- 50.00"/>
                                                        </div>
                                                    </td>
                                                    <td class="uk-text-right uk-text-middle"><a href="#"
                                                                                                class="btnSectionRemove"><i
                                                                    class="material-icons md-24">&#xE872;</i></a></td>
                                                </tr>
                                                <tr class="form_section">
                                                    <td><input type="text" class="md-input md-input-width-medium"
                                                               value="64GB"/></td>
                                                    <td class="uk-text-middle uk-text-center"><input type="checkbox"
                                                                                                     data-md-icheck
                                                                                                     checked/></td>
                                                    <td>
                                                        <div class="uk-input-group">
                                                                    <span class="uk-input-group-addon">
                                                                        <i class="uk-icon-usd"></i>
                                                                    </span>
                                                            <input type="text"
                                                                   class="md-input md-input-width-small uk-text-right"
                                                                   value="0.00"/>
                                                        </div>
                                                    </td>
                                                    <td class="uk-text-right uk-text-middle"><a href="#"
                                                                                                class="btnSectionRemove"><i
                                                                    class="material-icons md-24">&#xE872;</i></a></td>
                                                </tr>
                                                <tr class="form_section">
                                                    <td><input type="text" class="md-input md-input-width-medium"
                                                               value="128GB"/></td>
                                                    <td class="uk-text-middle uk-text-center"><input type="checkbox"
                                                                                                     data-md-icheck
                                                                                                     checked/></td>
                                                    <td>
                                                        <div class="uk-input-group">
                                                                    <span class="uk-input-group-addon">
                                                                        <i class="uk-icon-usd"></i>
                                                                    </span>
                                                            <input type="text"
                                                                   class="md-input md-input-width-small uk-text-right"
                                                                   value="+ 80.00"/>
                                                        </div>
                                                    </td>
                                                    <td class="uk-text-right uk-text-middle"><a href="#"
                                                                                                class="btnSectionRemove"><i
                                                                    class="material-icons md-24">&#xE872;</i></a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" class="uk-padding-remove">
                                                        <table class="uk-table"
                                                               data-dynamic-fields="field_template_b"></table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <script id="field_template_b" type="text/x-handlebars-template">
                                                <tr class="form_section">
                                                    <td class="uk-width-4-10"><input type="text"
                                                                                     class="md-input md-input-width-medium"
                                                                                     placeholder="Memory"/></td>
                                                    <td class="uk-width-2-10 uk-text-middle uk-text-center">
                                                        <input type="checkbox" data-md-icheck/>
                                                    </td>
                                                    <td class="uk-width-2-10 uk-text-right">
                                                        <div class="uk-input-group">-

                                                            <span class="uk-input-group-addon">
                                                                        <i class="uk-icon-usd"></i>
                                                                    </span>
                                                            <input type="text"
                                                                   class="md-input md-input-width-small uk-text-right"
                                                                   placeholder="Price"/>
                                                        </div>
                                                    </td>
                                                    <td class="uk-width-2-10 uk-text-right uk-text-middle">
                                                        <a href="#" class="btnSectionClone"><i class="material-icons md-24">&#xE145;</i></a>
                                                    </td>
                                                </tr>
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <div class="uk-grid" data-uk-grid-margin>
                                    <div class="uk-width-medium-2-10">
                                        <a class="md-btn" href="#">Add option</a>
                                    </div>
                                    <div class="uk-width-medium-8-10">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>-->

                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <h3 class="md-card-toolbar-heading-text">
                                Attributes/Options
                            </h3>
                        </div>
                        <div class="md-card-content">
                            <div class="uk-grid" data-uk-grid-margin>
                                <div class="uk-width-large-1-1">
                                    <?php if (isset($getCategoriesAttribute) && $getCategoriesAttribute != '') {
                                        foreach ($getCategoriesAttribute as $attributes) { ?>
                                            <div class="uk-form-row">
                                                <label for="product_edit_manufacturer_control">
                                                    <?php echo(isset($attributes->attribute_name) && $attributes->attribute_name != '' ? $attributes->attribute_name : '') ?></label>
                                                <input type="text" class="md-input"
                                                       id="product_edit_manufacturer_control"
                                                       name="product_edit_manufacturer_control"
                                                       value="<?php echo(isset($attributes->attribute_value) && $attributes->attribute_value != '' ? $attributes->attribute_value : '') ?>"/>
                                            </div>
                                        <?php }
                                    } ?>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <h3 class="md-card-toolbar-heading-text">
                                SEO
                            </h3>
                        </div>
                        <div class="md-card-content">
                            <div class="uk-grid" data-uk-grid-margin>
                                <div class="uk-width-large-1-1">
                                    <div class="uk-form-row">
                                        <label for="product_edit_manufacturer_control">Meta Title</label>
                                        <input type="text" class="md-input" id="product_edit_manufacturer_control"
                                               name="product_edit_manufacturer_control"
                                               value="<?php echo(isset($data->meta_title) && $data->meta_title != '' ? $data->meta_title : '') ?>"/>
                                    </div>
                                    <div class="uk-form-row">
                                        <label for="product_edit_name_control">Meta Description</label>
                                        <input type="text" class="md-input" id="product_edit_name_control"
                                               name="product_edit_name_control"
                                               value="<?php echo(isset($data->meta_description) && $data->meta_description != '' ? $data->meta_description : '') ?>"/>
                                    </div>
                                    <div class="uk-form-row">
                                        <label for="product_edit_name_control">URL</label>
                                        <input type="text" class="md-input" id="product_edit_name_control"
                                               name="product_edit_name_control"
                                               value="<?php echo(isset($data->link) && $data->link != '' ? $data->link : '') ?>"/>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php echo '<pre>';
            print_r($data);
            echo '</pre>'; ?>
        </form>
    </div>
</div>

<!-- page specific plugins -->
<!-- handlebars.js -->
<script src="<?php echo base_url() ?>assets/bower_components/handlebars/handlebars.min.js"></script>
<script src="<?php echo base_url() ?>assets/js/custom/handlebars_helpers.min.js"></script>
<!--  product edit functions -->
<script src="<?php echo base_url() ?>assets/js/pages/ecommerce_product_edit.min.js"></script>