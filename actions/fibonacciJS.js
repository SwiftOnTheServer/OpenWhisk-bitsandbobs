function fibo(n)
{
    var first,second,add;
    for(var i = 0; i < n;i++){
        if(i === 0){
            first = 1;
            second = 2;
        }
        add = first + second;
        first = second;
        second = add;
    }
    return add
}

function main(params) {

    var n = params["n"]

    return {result: fibo(n)}
}
