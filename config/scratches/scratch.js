function x(a, b, c) {
    shift(arguments);
    console.log(a,b,c);
    console.log(arguments);
}

function shift (args) {
    console.log(args);
    args.unshift(null);
}

ax(1,2);
