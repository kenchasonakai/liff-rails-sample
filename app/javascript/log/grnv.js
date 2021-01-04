window.addEventListener('load', () => {
  const default_apikey = 'https://api.gnavi.co.jp/RestSearchAPI/v3/?';
  const keyid = "keyid=cef47ca1112a065456f7be4443382b59";
  const submit_button = document.getElementById("submit");
  const get_location_button = document.getElementById("get_location_button")
  const latitude = document.getElementById("latitude")
  const longitude = document.getElementById("longitude")
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const get_current_location_success = (data) => {
    let crd = data.coords
    let get_latitude = crd.latitude;
    let get_longitude = crd.longitude;
    latitude.innerHTML = `緯度${get_latitude}`
    longitude.innerHTML = `経度${get_longitude}`
  }

  const error = () => {
    console.log("通信に失敗しました")
  }

  const logRecord_success = () => {
    liff.sendMessages([
      {
      type: 'text',
      text: 'ログの登録ができました！'
      }
    ])
    .then(() => {
      liff.closeWindow()
    })
    .catch((err) => {
      console.log('error', err);
    });
  }

  const set_query = () => {
    let name = document.getElementById("name").value;
    let latitude_query = latitude.textContent.replace('緯度', '')
    let longitude_query = longitude.textContent.replace('経度', '')
    let latitude_and_longitude_query = `&latitude=${latitude_query}&longitude=${longitude_query}&range=1&coordinates_mode=2`
    let hit_per_page = '&hit_per_page=10'
    let array = new Array();
    if(latitude_and_longitude_query){
      array.push(latitude_and_longitude_query)
    }
    if(name){
      array.push(`&name=${name}`)
    }
    if(hit_per_page){
      array.push(hit_per_page)
    }
    return array.join("")
  }

  const logRecord = (e) => {
    const element = e.target
    const elementName = element.innerHTML
    const elementId = element.dataset.grnvId
    const obj ={ name: elementName, grnvId: elementId }
    const body = Object.keys(obj).map((key)=>key+"="+encodeURIComponent(obj[key])).join("&");
    const request = new Request('/logs', {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
          'X-CSRF-Token': token
        },
        method: 'POST',
        body: body
    });
    if (window.confirm(`${elementName}でよろしいですか？`)) {
      fetch(request).then(logRecord_success, error)
    }
  }

  const grnv = () => {
    var result = document.getElementById("result");
    result.innerHTML = ""
    let query = set_query();
    let fetch_query = encodeURI(default_apikey + keyid + query)
    fetch(fetch_query)
    .then(response => response.json())
    .then(data => {
      for(element of data.rest){
        let p = document.createElement("p")
        let shopName = document.createTextNode(element.name);
        p.setAttribute("data-grnv-id", element.id)
        p.setAttribute("class", "result-list")
        p.onclick = logRecord
        p.appendChild(shopName)
        result.appendChild(p)
      }
    })
  }


  navigator.geolocation.getCurrentPosition(get_current_location_success, error)

  get_location_button.addEventListener('click', () => {
    navigator.geolocation.getCurrentPosition(get_current_location_success, error)
  }, false)

  submit_button.addEventListener('click', () => {
    grnv()
  }, false);
});
