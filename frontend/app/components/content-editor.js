import Ember from 'ember';

export default Ember.Component.extend({

  classNames: [ 'editable-component', 'content-editor' ],

  classNameBindings: [ 'isEditing' ],

  isEditing: false,
  pendingStateChange: false,

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
    console.log(`In content editor: didInsertElement`);
    console.log(window.getSelection());
    this.setProperties({ 
      isEditing: true, 
      isPendingStateChange: true 
    });
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
    this.setProperties({ isEditing: true, pendingStateChange: true });
    this.get('onClick')(this);
  },

  didRender() {
    this._super(...arguments);
    if(this.get('pendingStateChange')) {
      this.set('pendingStateChange', false);
      if(this.get('isEditing')) {
        this.$().focus();
      } else {
        this.$().blur();
      }
    }
  }
});
