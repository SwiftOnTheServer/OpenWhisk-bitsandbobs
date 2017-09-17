//
// wsk action update paramsjs params.js --web true
//
// curl https://openwhisk.ng.bluemix.net/api/v1/web/19FT_dev/default/paramsjs.json | jq -S
// curl -k https://192.168.33.13/api/v1/web/guest/default/paramsjs.json | jq -S
//
function main(params) {
    return {
        params: params,
    }
}
