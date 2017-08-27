import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    let store = this.get('store');
    let doc = store.createRecord('content-document');
    let block = store.createRecord('content-block');
    block.set('contentDocument', doc);
    block.set('text', "This is a pre-built content block");
    return doc;
  }
});
