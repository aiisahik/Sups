/*
 * jQuery File Upload Plugin JS Example 6.5.1
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/*jslint nomen: true, unparam: true, regexp: true */
/*global $, window, document */

$(function () {
    'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload();

        $(document).bind('drop', function (e) {
            alert("test");
        var url = $(e.originalEvent.dataTransfer.getData('text/html')).filter('img').attr('src');
        if (url) {
            $.getImageData({
                url: url,
                success: function (img) {
                    var canvas = document.createElement('canvas');
                    if (canvas.getContext) {
                        canvas.getContext('2d').drawImage(img, 0, 0);
                        canvasToBlob(canvas, function (blob) {
                            $('#fileupload').fileupload('add', {files: [blob]});
                        });
                    }
                }
            });
        }
    });
        
    $(document).bind('drop dragover', function (e) {
        e.preventDefault();
    });
    
    // Enable iframe cross-domain access via redirect option:


    $('#fileupload').each(function () {
        var that = this;
        $.getJSON(this.action, function (result) {
            if (result && result.length) {
                $(that).fileupload('option', 'done')
                    .call(that, null, {result: result});
            }
        });
    });

});