import Ember from 'ember';

export default Ember.Component.extend({

  store: Ember.inject.service(),

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
      console.log("In document editor: blockSelected");
    },

    contentDeleted(contentBlock) {
      console.log("In document editor: contentDeleted");
    },

    contentCompleted(contentBlock) {
      console.log("In document editor: contentCompleted");
      let blocks = this.get('model.contentBlocks');
      let idx = blocks.indexOf(contentBlock.get('model'));
      let block = this.get('store').createRecord('content-block');
      contentBlock.setProperties({ isEditing: false, pendingStateChange: true })
      block.setProperties({ isEditing: true, pendingStateChange: true });
      blocks.insertAt(idx + 1, block);
      if(Ember.isEmpty(contentBlock.get('model.text'))) {
        blocks.removeAt(idx);
      }
    }
  }
});
