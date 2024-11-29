$(document).ready(function () {
  window.addEventListener("message", function (event) {
    if (event.data.type == "menu") {
      event.data.status
        ? (document.body.style.opacity = "1")
        : (document.body.style.opacity = "0");

      document.querySelector(".name .desc").innerHTML =
        "<i class='fa-light fa-id-card'></i>NAME: <span>" +
        event.data.firstname +
        " " +
        event.data.lastname +
        "</span>";

      document.querySelector(".job .desc").innerHTML =
        "<i class='fa-light fa-user'></i>JOB: <span>" +
        event.data.joblabel +
        " - " +
        event.data.jobname +
        "</span>";

      document.querySelector(".cash .desc").innerHTML =
        "<i class='fa-light fa-money-bills-simple'></i>CASH: <span>" +
        formatter.format(event.data.money) +
        "</span>";
      document.querySelector(".bank .desc").innerHTML =
        "<i class='fa-light fa-building-columns'></i>BANK: <span>" +
        formatter.format(event.data.bank) +
        "</span>";
    }
  });
});

var formatter = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
  minimumFractionDigits: 0,
});

function openMap() {
  document.body.style.opacity = "0";
  $.post(`https://${GetParentResourceName()}/openMap`);
}

function openSettings() {
  document.body.style.opacity = "0";
  $.post(`https://${GetParentResourceName()}/openSettings`);
}

function closeGame() {
  document.body.style.opacity = "0";
  $.post(`https://${GetParentResourceName()}/closeGame`);
}

function joinDiscord() {
  window.invokeNative("openUrl", "https://discord.gg/toxicfivem");
}

function closemenu() {
  document.body.style.opacity = "0";
  $.post(`https://${GetParentResourceName()}/closeMenu`);
}

document.addEventListener("keydown", function (event) {
  if (event.key === "Escape") {
    closemenu();
  }
});
