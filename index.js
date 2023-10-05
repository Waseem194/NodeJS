// let x=10;
// let y=20;
// console.log(x+y);
//////////////////////////////////////////////
// const fs= require('fs');
// fs.writeFileSync("hello.txt",'waseem');
// console.log("->>",__filename);
////////////////////////////////////////////////////////////
// const gs=require('fs').writeFileSync;
// gs('abc.txt','some code');
// ////////////////////////////////////////////
// Make Basic Server Output on Browser
const http = require('http');
http.createServer((req,resp)=>{
  resp.write('<h1>my first server connection</h1>');
  resp.end();
}).listen(786, () => console.log("listening"));
