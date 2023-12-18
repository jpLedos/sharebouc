export const setOneComment = async ($userId, $myComment) => {
    return axios.patch(`${API_URL}comments/${$userId}`, $myComment, myPatchConfig())
    .then(response =>response.data)
};

async function post(e) {
    e.preventDefault();
    form = e.target.parentNode;
    let payload = new FormData(e.form);

    // var status = document.querySelector('#messagePost')
    var status = "";
      
    try {
        const response = await fetch(e.target.action, {
            method: "POST",
            body: payload,
            headers: {
                Accept: "application/json",
            },
        });
        if (response.ok) {
            success()
            status = "enregistré";
        } else {
            data = await response.json();
            status = data.detail;
            window.location = "/login";
        }
    } catch (err) {
        status = err.message;
        window.location = "/login";
    }

    console.log("status post :", status);
}


export const ArrayAvgNote = (myArray) => {
    var i = 0,
        summ = 0,
        count = 0
    const arrayLen = myArray.length;
    while (i < arrayLen) {
        if (myArray[i].note > 0) {
            count++; 
            summ = summ + myArray[i].note;
        }
        i++;
    }
    
    if(arrayLen > 0) {
        return summ / count;
    }else {
        return 0
    }
};

 
