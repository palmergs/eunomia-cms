import Ember from 'ember';

export default Ember.Component.extend({

  classNames: [ 'editable-component', 'document-editor' ],

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

  actions: {
    blockSelected(contentBlock) {
      this.get('onBlockSelected')();
    },

    contentDeleted(contentBlock) {
      this.send('contentDeleted', contentBlock);
    },

    contentCompleted(contentBlock) {
      this.send('contentCompleted', contentBlock);
    }
  }
});
