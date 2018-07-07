import Ember from 'ember';

export default Ember.Component.extend({

  classNames: [ 'editable-component', 'content-editor' ],

  classNameBindings: [ 'isEditing' ],

  isEditing: false,

  syncText() {
    console.log("In syncText:");
    let textarea = this.$().find('textarea');
    if(textarea.length > 0) {
      this.set('model.text', textarea.val());
    }
  },

  didRender() {
    this._super(...arguments);
    console.log("In content editor: didRender");
  },

  didInsertElement() {
    this._super(...arguments);
    console.log('In content editor: didInsertElement isNew='+ this.get('model.isNew'));
    console.log(window.getSelection());
    if(this.get('model.isNew')) {
      this.setProperties({ 
        isEditing: true, 
        isPendingStateChange: true 
      });
    }
  },


  keyPress(evt) {
    console.log(evt.key, evt.shiftKey, evt.ctrlKey, evt.altKey);
    console.log(window.getSelection());
    if(evt.key == 'Enter' && !evt.shiftKey) {
      evt.preventDefault();
      this.syncText();
      this.get('onCompleted')(this)
    }
  },

  focusIn(evt) {
    console.log("In focus in...");
    console.log(window.getSelection());
  },

  focusOut(evt) {
    console.log("In focus out...");
    console.log(window.getSelection());
    this.syncText();
  },

  click(evt) {
    console.log("In click...");
    console.log(window.getSelection());
    if(!this.get('isEditing')) {
      this.setProperties({ isEditing: true, lastClickEvent: evt });
      this.get('onClick')(this);
    }
  },

  didRender() {
    this._super(...arguments);
    console.log('In content editor: didRender - isEditing=' +this.get('isEditing'));
    if(this.get('isEditing')) {
      const elem = this.$(); 
      const evt = this.get('lastClickEvent');
      const textarea = elem.find('textarea');
      if(textarea.length > 0) {
        textarea.focus();
        let len = textarea.val().length;
        if(evt) {
          console.log("Last event was:", evt.clientX, evt.clientY);
          if(document.caretPositionFromPoint) {
            console.log("caretPositionFromPoint");
            let range = document.caretPositionFromPoint(evt.clientX, evt.clientY);
            let textNode = range.offsetNode;
            let offset = range.offset;
            console.log("offset = ", offset);
            textarea.get(0).setSelectionRange(offset, offset);
          } else if(document.caretRangeFromPoint) {
            console.log("caretRangeFromPoint");
            let range = document.caretRangeFromPoint(evt.clientX, evt.clientY);
            let textNode = range.startContainer;
            let offset = range.startOffset;
            console.log("offset = ", offset);
            textarea.get(0).setSelectionRange(offset, offset);
          } else {
            textarea.get(0).setSelectionRange(len, len);
          }
        } else {
          console.log("No last event:", evt);
          textarea.get(0).setSelectionRange(len, len);
        }
      }
    } else {
      this.$().blur();
    }

    this.set('lastClickEvent', null);
  }
});
