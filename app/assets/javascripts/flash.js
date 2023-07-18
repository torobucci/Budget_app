document.addEventListener("DOMContentLoaded", function() {
    var noticeMessage = document.querySelector(".notice");
    var alertMessage = document.querySelector(".alert");

    if (noticeMessage) {
      noticeMessage.style.opacity = "1";
      setTimeout(function() {
        noticeMessage.style.opacity = "0";
        setTimeout(function() {
          noticeMessage.parentNode.removeChild(noticeMessage);
        }, 300);
      }, 3000);
    }

    if (alertMessage) {
      alertMessage.style.opacity = "1";
      setTimeout(function() {
        alertMessage.style.opacity = "0";
        setTimeout(function() {
          alertMessage.parentNode.removeChild(alertMessage);
        }, 300);
      }, 3000);
    }
  });
