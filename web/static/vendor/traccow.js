(function() {
  document.addEventListener('DOMContentLoaded', function DOMContentLoaded() {
    if (Notification.permission !== "granted") Notification.requestPermission();
    var $bodyEl = $('body'),
        $sidedrawerEl = $('#sidedrawer');


    // ==========================================================================
    // Toggle Sidedrawer
    // ==========================================================================
    function showSidedrawer() {
      // show overlay
      var options = {
        onclose: function() {
          $sidedrawerEl
            .removeClass('active')
            .appendTo(document.body);
        }
      };

      var $overlayEl = $(mui.overlay('on', options));

      // show element
      $sidedrawerEl.appendTo($overlayEl);
      setTimeout(function() {
        $sidedrawerEl.addClass('active');
      }, 20);
    }


    function hideSidedrawer() {
      $bodyEl.toggleClass('hide-sidedrawer');
    }


    $('.js-show-sidedrawer').on('click', showSidedrawer);
    $('.js-hide-sidedrawer').on('click', hideSidedrawer);


    // ==========================================================================
    // Animate menu
    // ==========================================================================
    var $titleEls = $('strong', $sidedrawerEl);

    $titleEls
      .next()
      .hide();

    $titleEls.on('click', function() {
      $(this).next().slideToggle(200);
    });
  });
})();

function goBack() {
  window.history.back();
}

function ajax(method, path, data, async, onreadystatechange, reload) {
  reload = (reload === 'undefined' ? true : false);
  async = async ? async : true;
  var xhttp = new XMLHttpRequest();
  if(onreadystatechange) {
    xhttp.onreadystatechange = onreadystatechange;
  }
  xhttp.open(method, path, async);
  if(data) {
    data.headers.forEach(function(h) {
      xhttp.setRequestHeader(h.headers, h.data);
    });
    xhttp.send(data.data);
  } else {
    xhttp.send();
    if(reload) location.reload();
  }
  return true;
}

/* ag-grid functions */
function cellCheckbox(params, method, path) {
  return "<div class='center'><input type='checkbox' "
  + (params.data.status ? "checked" : "")
  + " onclick=\"ajax('"+ method +"','" + path + "')\" /></div>";
}

function returnTheSame(params) {
    params.data[params.colDef.field] = params.oldValue;
}

function linkTo(path_to, label) {
  return '<a href="' + path_to + '">' + label + '</a>';
}

function gridCommands(buttons) {
  var result = "";
  buttons.forEach(function(b) {
    result += '<a type="button" class="btn btn-xs btn-'
    + (b.class ? b.class : "default") + '" '
    + "onclick=\""  + b.onclick + '\" '
    + 'data-method="' + (b.method ? b.method : "get")
    + '" href="'
    + b.path + '" title="' + b.title + '"><span class="zmdi zmdi-'
    + b.icon + '"></span></a>&nbsp;';
  });
  return '<div class="center">' + result + '</div>';
}

function gridSizeToFit(grid, gridDiv, offset) {
  gridDiv.style.setProperty("height", (window.innerHeight - offset)+"px")
  grid.gridOptions.api.sizeColumnsToFit();
}

function sizeToFit(grid, gridDiv, offset) {
  setTimeout(gridSizeToFit(grid, gridDiv, offset), 100);
}

function notifyMe(body) {
  if (!Notification) {
    alert("Desktop notifications not available in your browser. Try using Chromium.");
    return;
  }

  if (Notification.permission !== "granted")
    Notification.requestPermission();
  else {
    var notification = new Notification("TracCow", {
      icon: "images/logo.jpg",
      body: body,
    });

    notification.onclick = function notifyMe_onClick(x) {
      notification.close();
      window.focus();
    };
  }
}

function killAlert() {
  var keepKilling = false, arr = document.getElementsByClassName('alert');
  for(var i=0;i<arr.length;i++) {
    if (arr[i].innerHTML !== '')
      arr[i].innerHTML = '';
    else
      keepKilling = true;
  }
  if (keepKilling) setTimeout(killAlert, 3000);
}

function confirmDelete(){
  var resp = confirm("Desea eliminar este registro?");
  return resp;
}
