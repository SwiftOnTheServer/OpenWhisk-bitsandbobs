//
// curl "https://openwhisk.ng.bluemix.net/api/v1/experimental/web/19FT_dev/default/params.json?a=b&c=d"
//
func main(args: [String:Any]) -> [String:Any] {

    // unset the WebAction data as it gets in the way
    // when testing what -p and -a final true do!
    var args = args
    args["__ow_meta_path"] = nil
    args["__ow_meta_verb"] = nil
    args["__ow_meta_headers"] = nil

    return args
}
