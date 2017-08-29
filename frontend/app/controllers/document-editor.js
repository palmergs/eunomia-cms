import Ember from 'ember';

export default Ember.Controller.extend({

  actions: {
    blockSelected(contentBlock) {
      console.log("Block was selected..."); 
    },

    onContentDeleted(contentBlock) {
      console.log("Content was deleted...");
    },

    onContentCompleted(currentBlock) {
      console.log("Content was completed");
    }
  }
});
