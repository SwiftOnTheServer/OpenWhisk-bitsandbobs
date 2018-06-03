const openwhisk = require('openwhisk');

function main(params) {
    return new Promise(function(resolve, reject) {

        const ow = openwhisk();

        console.log(params.items.length + " items to be invoked")
        let actions = params.items.map(function (item) {
            return ow.actions.invoke({actionName: "/whisk.system/utils/echo", params: {message: item.id}});
        });

        return Promise.all(actions).then(function (results) {
            console.log(actions.length + " actions invoked")
            return {number_invoked: actions.length}
        })
        .catch(function (err) {
            console.error('Error invoking actions', err)
            return reject({error: err});
        });
    })
 }

