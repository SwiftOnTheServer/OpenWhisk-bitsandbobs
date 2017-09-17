<?php
//
// curl "https://openwhisk.ng.bluemix.net/api/v1/experimental/web/19FT_dev/default/params.json?a=b&c=d"
//
function main(array $args) : array
{
    // unset the WebAction data except for __ow_method
    unset($args["__ow_headers"]);
    unset($args["__ow_path"]);
    unset($args["__ow_meta_verb"]);
    unset($args["__ow_meta_headers"]);

    return $args;
}
