import Ember from 'ember';

export default Ember.Component.extend({

  classNames: [ 'editable-component', 'content-editor' ],

  classNameBindings: [ 'isEditing' ],

  attributeBindings: [ 'isEditing:contenteditable' ],

  isEditing: false,

  keyPress(evt) {
    console.log(evt.key, evt.metaCode, evt.shiftKey, evt.ctrlKey, evt.altKey);
    if(evt.key == 'Enter' && !evt.shiftKey) {
      evt.preventDefault();
    }
  },

  click(evt) {
    this.set('isEditing', true);
  }

});
