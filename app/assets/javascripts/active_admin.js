//= require active_admin/base

var iframe;
function resizeFrame() {
  if (!iframe) {
    iframe = document.querySelector('iframe');
  }
  if (!iframe) {
    return;
  }
  iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
}
setInterval(resizeFrame, 1000);
