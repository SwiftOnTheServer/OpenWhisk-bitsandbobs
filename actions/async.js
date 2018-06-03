const { promisify } = require('util');
const request = promisify(require('request'));

async function main({
  location='Vermont',
  url=`https://query1.yahooapis.com/v1/public/yql?q=select item.condition from weather.forecast where woeid in (select woeid from geo.places(1) where text="'${location}'")&format=json`
}){
  let response
  try {
    response = await request(url)
  } catch (err) {
    console.error('Http error', err)
    // return Promise.reject({Error:err});
    return {error: {Error:err}};
    return Promise.reject("failed");
    // return {error: "failed"}
  }
  return JSON.parse(response.body).query.results.channel.item.condition;
}
