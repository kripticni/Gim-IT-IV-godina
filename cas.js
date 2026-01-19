let x = parseInt(prompt("Ceo broj: "));
let y = parseFloat(prompt("Decimalan broj"));
let z = x%y;
alert(z.toFixed(2));
let a = 3;
let b = 4;
z = Math.sqrt(a**2+b**2);
alert("Ostatak je " + z);
a=5;
a++;
a++;
alert(a);
a--;
alert(a);
a=0;
a+=3;
a*=4;
alert(a);
a-=4;
a/=2;
alert(a);
alert(1/0); // Infinity
alert(Math.sqrt(-1)); // NaN
alert('Jednostruki navodnici');
alert("Dvostruki apostrofi");
alert(`Obrnuti apostrof`);
alert(`Reko je: "Sacekaj metu!" i potrc'o`);
alert('Prvi nacin: Apostrof \', navodnici ", obrnuti navodnik `');
alert("Reko je: \"Sacekaj metu!\" i potrc'o");
x = 'Java';
y = 'Script';
z = x + ' ' + y;
alert(z);
z = x + '2';
alert(z);
z = `${x}${y}`;
alert(z);
z = `${x+y}`;
alert(z);
z = `${x}2`
alert(z);
a = 2;
b = 3;
alert(`${a}+${b}=${a+b}`);
alert(a+'+'+b+'='+(a+b));
let j = "JavaScript";
alert(j[0]+j[4]);
alert(j[j.length-2]+j[j.length-4]+j[1]+j[2]+j[1]);
x = "Gram";
y = "Prodekan";
alert(y.slice(0,3)+x);
alert(x.toLowerCase());
alert(`${3**2} = 3**2`);

// uneti cm u metrima i cm
let duzina = parseFloat(prompt("Unesi duzinu u cm"));
alert(`To je ${duzina/100} metara, a ${duzina} centimetara.`)
