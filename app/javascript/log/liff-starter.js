window.addEventListener('load', () => {
  const logout_button = document.getElementById("logout_button")
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const Example = (jsonObj) => {
    const data = jsonObj;
    console.log(data.msg);
  }

  liff.init({
    liffId: "1655381466-modX62Ob"
  })
  .then(() => {
    if (!liff.isLoggedIn()) {
      liff.login();
    }
    liff.getProfile()
    .then(profile => {
      const body = Object.keys(profile).map((key)=>key+"="+encodeURIComponent(profile[key])).join("&");
      const user_name_display = document.getElementById("user_name")
      const user_name = document.createTextNode(profile.displayName)
      if(user_name_display){
        user_name_display.append(user_name)
      }
      let request = new Request('/users', {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
          'X-CSRF-Token': token
        },
        method: 'POST',
        body: body
      });
      fetch(request).then((response) => {
        return response.json()
      })
      .then((result) => {
        Example(result)
      })
      .catch((err) => {
        console.log('error', err);
      })
    })
    .catch((err) => {
      console.log('error', err);
    });
  })
  .catch((err) => {
    // Error happens during initialization
    console.log(err.code, err.message);
  });

  if(logout_button){
    logout_button.addEventListener('click', () => {
      if (liff.isLoggedIn()) {
        liff.logout();
        location.reload();
      }
      else{
        alert('logout failed')
      }
    }, false)
  }
});
