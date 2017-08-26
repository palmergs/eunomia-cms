import Ember from 'ember';

export default Ember.Component.extend({

  classNames: [ 'editable-component', 'document-editor' ],

  classNameBindings: [ 'isEditing' ],

  attributeBindings: [ 'contenteditable' ],

  isEditing: false,
  contenteditable: true,

  init() {
    this._super(...arguments);
    console.log("In init...");
  },

  didReceiveAttrs() {
    this._super(...arguments);
    console.log("In didReceiveAttrs...");
  },

  didUpdateAttrs() {
    this._super(...arguments);
    console.log("In didUpdateAttrs...");
  },

  willRender() {
    this._super(...arguments);
    console.log("In willRender...");
  },

  didInsertElement() {
    this._super(...arguments);
    console.log("In didInsertElement...");
  },

  didRender() {
    this._super(...arguments);
    console.log("In didRender...");
  },

  willUpdate() {
    this._super(...arguments);
    console.log("In willUpdate...");
  },

  didUpdate() {
    this._super(...arguments);
    console.log("In didUpdate...");
  },

  keyPress(evt) {
    if(evt.charCode == 13) {
      evt.preventDefault();
      console.log("Prevented!");
    }
    console.log(evt);
  }

});
