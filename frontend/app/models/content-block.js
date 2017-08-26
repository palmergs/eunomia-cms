import DS from 'ember-data';

export default DS.Model.extend({
  contentDocument: DS.belongsTo('content-document'),
  blockType: DS.attr('string'),
  contentType: DS.attr('string'),
  text: DS.attr('string'),
  html: DS.attr('string')
});
