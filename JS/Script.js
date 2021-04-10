(function() {

const script = 'https://ghosthub.live/script.lua\'))()';

const copyButton = document.getElementById('copyScriptButton')


copyButton.onclick = function() {
    navigator.clipboard.writeText(script).then(doc => {
        copyButton.innerHTML = 'Copied Script To Clipboard'
        setTimeout(function() {
            copyButton.innerHTML = 'Copy Script'
        }, 2500)
    });
};

})();
