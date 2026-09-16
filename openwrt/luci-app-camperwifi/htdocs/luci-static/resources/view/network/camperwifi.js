'use strict';
'require view';
'require fs';
'require ui';

return view.extend({
    load: function() { return fs.exec('/usr/bin/camperwifi-portal-status'); },
    render: function(status) {
        var output = (status.stdout || '').trim();
        var isOn = output.indexOf('ON') === 0;
        var statusBox = E('div', {'class':'cbi-section'}, [
            E('strong', {}, 'Portal Mode: '), E('span', {}, isOn ? output : 'OFF')
        ]);
        var onButton = E('button', {
            'class':'btn cbi-button cbi-button-apply',
            'click': ui.createHandlerFn(this, function() {
                return fs.exec('/usr/bin/camperwifi-portal-on').then(function(res) {
                    if (res.code !== 0) throw new Error(res.stderr || 'Failed to enable portal mode');
                    location.reload();
                }).catch(function(err) {
                    ui.addNotification(null, E('p', {}, 'Failed to enable portal mode: ' + err.message));
                });
            })
        }, 'Enable Portal Mode');
        var offButton = E('button', {
            'class':'btn cbi-button cbi-button-reset', 'style':'margin-left:10px;',
            'click': ui.createHandlerFn(this, function() {
                return fs.exec('/usr/bin/camperwifi-portal-off').then(function(res) {
                    if (res.code !== 0) throw new Error(res.stderr || 'Failed to disable portal mode');
                    location.reload();
                }).catch(function(err) {
                    ui.addNotification(null, E('p', {}, 'Failed to disable portal mode: ' + err.message));
                });
            })
        }, 'Disable Portal Mode');
        return E('div', {'class':'cbi-map'}, [
            E('h2', {}, 'Campground Portal'),
            E('p', {}, 'Temporarily route the reserved iPad through campground Wi-Fi for captive portal authentication.'),
            statusBox, E('div', {'class':'cbi-section'}, [onButton, offButton])
        ]);
    },
    handleSaveApply:null, handleSave:null, handleReset:null
});
