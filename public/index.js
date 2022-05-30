function translateText() {
  const url = "{your-RestAPIEndpoint}"; // Replace this with RestAPIEndpoint
  const text = document.getElementById("japanese").value;
  axios
    .post(url, {
      text,
    })
    .then((res) => {
      document.getElementById("english").value = res.data;
    })
    .catch((error) => {
      document.getElementById("err").innerHTML = error;
    });
}
