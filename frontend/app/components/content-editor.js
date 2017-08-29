import Ember from 'ember';

export default Ember.Component.extend({

  classNames: [ 'editable-component', 'content-editor' ],

  classNameBindings: [ 'isEditing' ],

  attributeBindings: [ 'isEditing:contenteditable' ],

  isEditing: false,
  pendingStateChange: false,

  keyPress(evt) {
    console.log(evt.key, evt.metaCode, evt.shiftKey, evt.ctrlKey, evt.altKey);
    if(evt.key == 'Enter' && !evt.shiftKey) {
      evt.preventDefault();
      this.send("contentCompleted", this);
    }
  },

  click(evt) {
    console.log("In click...");
    this.setProperties({ isEditing: true, pendingStateChange: true });
    this.get('onClick')();
  },

  didRender() {
    this._super(...arguments);
    if(this.get('pendingStateChange')) {
      this.set('pendingStateChange', false);
      if(this.get('isEditing')) {
        this.$().focus();
      }
    }
  }

});
