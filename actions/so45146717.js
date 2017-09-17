//
// wsk action update so45146717 so45146717.js --web true
//

function main(params) {
    return {
        headers: {
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Origin': "http://example.com',
            'Access-Control-Allow-Credentials': 'true',
            'Content-Type': 'text/xml'
        },
        body: '<root><hello>world</hello></root>'
    }
 }
