let playerScore = 0;
let computerScore = 0;
let scores = document.createElement('p');
let body = document.querySelector('body');
const results = document.createElement('div');
body.appendChild(results);

const buttons = document.querySelectorAll('button');
buttons.forEach((button) => {
    button.addEventListener('click', () => {
        let playerSelection = button.className;
        let computerSelection = computerPlay();
        let roundResult =  playRound(playerSelection, computerSelection);
        console.log(roundResult);
        score();
        gameEnd();
        if (roundResult === 'playerWin') {
            playerScore++;
        } else if (roundResult === 'computerWin') {
            computerScore++;
        }
    })
})

//computer pick
function computerPlay() {
    const pick = ['rock', 'paper', 'scissors'];
    return pick[Math.floor(Math.random() * pick.length)];
}

// Round Play
function playRound(playerSelection, computerSelection) {
    //message that specifies the winner
    let tie = `It's a tie you both picked ${playerSelection}`;
    let playerWin = `You win this round! ${playerSelection} beats ${computerSelection}`;
    let computerWin = `You lose this round! ${computerSelection} beats 
    ${playerSelection}`;

    if(playerSelection === computerSelection) {
        results.innerHTML = tie;
        return 'tie';
    } else if (playerSelection === 'rock' && computerSelection === 'scisors') {
        results.innerHTML = playerWin;
        return 'playerWin';
    } else if (playerSelection === 'paper' && computerSelection === 'rock') {
        results.innerHTML = playerWin;
        return 'playerWin';
    } else if (playerSelection === 'scissors' && computerSelection === 'paper') {
        results.innerHTML = playerWin;
        return 'playerWin';
    } else {
        results.innerHTML = computerWin;
        return 'computerWin';
    }
}

function score() {
    //new element where score would be seen
    scores.innerHTML = `player: ${playerScore} | computer: ${computerScore}`; 
    body.appendChild(scores); 
}

function gameEnd() {
    if(playerScore === 10 || computerScore === 10) {
        document.querySelector('.rock').disabled = true;
        document.querySelector('.paper').disabled = true;
        document.querySelector('.scissors').disabled = true;
        if (playerScore > computerScore) {
            alert('You win the game');
        } else if (computerScore > playerScore) {
            alert('Aww you lose');
        }
    }
}