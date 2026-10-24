import GLib from 'gi://GLib';
import St from 'gi://St';
import { Extension } from 'resource:///org/gnome/shell/extensions/extension.js';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';

export default class NovaClockExtension extends Extension {
    enable() {
        this._dateMenu = Main.panel.statusArea.dateMenu;
        this._oldDateMenuVisible = this._dateMenu?.container?.visible ?? true;
        this._dateMenu?.container?.hide();
        this._clock = new St.Label({
            text: '',
            y_align: 2,
            style: 'font-weight: 600; padding: 0 12px; color: #f4f6ff;',
            accessible_name: 'Time and date in Arabic and English',
        });
        Main.panel._centerBox.add_child(this._clock);
        this._updateClock();
        this._timer = GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 1, () => {
            this._updateClock();
            return GLib.SOURCE_CONTINUE;
        });
    }
    _updateClock() {
        if (!this._clock)
            return;
        const now = new Date();
        const arTime = new Intl.DateTimeFormat('ar-EG', { hour: 'numeric', minute: '2-digit', hour12: true }).format(now);
        const enTime = new Intl.DateTimeFormat('en-GB', { hour: 'numeric', minute: '2-digit', hour12: true }).format(now);
        const arDate = new Intl.DateTimeFormat('ar-EG', { weekday: 'short', day: 'numeric', month: 'short' }).format(now);
        const enDate = new Intl.DateTimeFormat('en-GB', { weekday: 'short', day: 'numeric', month: 'short' }).format(now);
        this._clock.set_text(arTime + ' · ' + arDate + '  |  ' + enTime + ' · ' + enDate);
    }
    disable() {
        if (this._timer) {
            GLib.source_remove(this._timer);
            this._timer = 0;
        }
        this._clock?.destroy();
        this._clock = null;
        if (this._dateMenu?.container && this._oldDateMenuVisible)
            this._dateMenu.container.show();
        this._dateMenu = null;
    }
}