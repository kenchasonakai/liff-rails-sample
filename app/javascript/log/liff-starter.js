window.addEventListener('load', () => {
  const logout_button = document.getElementById("logout_button")
  liff.init({
    liffId: "1655381466-modX62Ob"
  })
  .then(() => {
    if (!liff.isLoggedIn()) {
      liff.login();
    }
    // Start to use liff's api
    const idToken = liff.getIDToken();
    console.log(idToken)
    liff.getProfile()
    .then(profile => {
    const name = profile.displayName
      console.log(name)
    })
    .catch((err) => {
     console.log('error', err);
    });
  })
  .catch((err) => {
    // Error happens during initialization
    console.log(err.code, err.message);
  });

  logout_button.addEventListener('click', () => {
    if (liff.isLoggedIn()) {
      liff.logout();
      location.reload();
    }
    else{
      alert('logout failed')
    }
  }, false)
});
