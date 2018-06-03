"use strict";

const openwhisk = require('openwhisk');

async function main(params) {

    const ow = openwhisk();

    console.log(params.items.length + " items to be invoked")
    let actions = params.items.map(function (item) {
        return ow.actions.invoke({actionName: "/whisk.system/utils/echo", params: {message: item.id}});
    });

    try {
        const responses = await Promise.all(actions);
    } catch (err) {
        console.error('Error invoking actions', err)
        return Promise.reject({error: err});
    }
    console.log(actions.length + " actions invoked")
    return {number_invoked: actions.length}
 }

