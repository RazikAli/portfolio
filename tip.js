window.onload = () =>
    //calls the calculation button
    {
        /* calculate the tip for the bill.*/
        document.querySelector('#calculate').onclick = calculateTip;
    }

let ti = prompt("how was your experience? ");
alert(`thank you for the response, we will take it into consideration `);

let bn = prompt("how old are you");
let c = (bn > 15) ? "Sorry for the inconvience" : "Sorry you can't access this app" + window.close();
alert(c);

    
function calculateTip() {
    // assign id to the values on the form 
    let amount = document.querySelector('#amount').value;
    let persons = document.querySelector('#persons').value;
    let service = document.querySelector('#services').value;
    let tips = document.querySelector('#tips').value;

    console.log(service);
    // will enter a value if ou clikc the result button without putting any values 
    if (amount === '' && service === 'Select' || amount === '' && tips === 'Select'){
        alert("Please enter valid values");
        return;
    }

    // checking the amount of people 
    if (persons === '1')
    //if there is only one person then we need not to display each.
        document.querySelector('#each').style.display = 'none';
    else
    //if there are more than one person we will display each.  
        document.querySelector('#each').style.display = 'block';

    /*calculating the tip by multiplying total-bill and type of
    service; then dividing it by number of persons.*/
    //fixing the total amount upto 2 digits of decimal
    let total = (amount * service || amount * tips / 100) / persons;
    total = total.toFixed(2);

    //finally displaying the tip value 
    document.querySelector('.tip').style.display = 'block';
    document.querySelector('#total').innerHTML = total;
}
calculateTip()


