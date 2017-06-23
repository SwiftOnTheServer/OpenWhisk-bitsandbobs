//
// wsk action update envjs env.js --web true
//
// curl https://openwhisk.ng.bluemix.net/api/v1/web/19FT_dev/default/envjs.json | jq -S
// curl -k https://192.168.33.13/api/v1/web/guest/default/envjs.json | jq -S
//
function main(params) {
    env = process.env
    env.__OW_API_KEY = "**REDACTED**"
    return {
        args: params,
        env: env
    }
}
