import Ember from 'ember';

export default Ember.Controller.extend({

  activeBlock: null, 

  actions: {
    blockSelected(contentBlock) {
      console.log("Block was selected...", contentBlock); 
    },

    contentDeleted(contentBlock) {
      console.log("Content was deleted...", contentBlock);
    },

    contentCompleted(currentBlock) {
      let block = this.store.createRecord('content-block')
      console.log("Content was completed...", contentBlock);
    }
  }
});
