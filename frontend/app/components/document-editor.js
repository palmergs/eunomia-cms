import Ember from 'ember';

export default Ember.Component.extend({

  classNames: [ 'editable-component', 'document-editor' ],

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
  }

});
