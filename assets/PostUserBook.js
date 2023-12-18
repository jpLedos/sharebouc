// fonction envoie async d'une reponse (en audit et en restitution)
async function userBookPost(e) {
  console.log("submitted");
  e.preventDefault();
  let payload = new FormData(e.target);

  var response = "";
  console.log(e.target.action, payload);
  fetch(e.target.action, {
    method: "POST",
    body: payload,
    headers: {
      Accept: "application/json",
    },
  })
  .then((response) => {
    if (response.ok) {
      response = "enregistré !";
    } else {
      response.json().then((data) => {
        console.log(data);
        if (Object.hasOwn(data, "errors")) {
          response = data["errors"].map((error) => error.message).join(", ");
        } else {
          response = "Oups ! pb d'envoi du formulaire !";
        }
      }, "error");
    }
    console.log("response post :", response);
  });
}