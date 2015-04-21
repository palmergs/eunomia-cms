require 'rails_helper'

RSpec.describe DataTemplate, as: :model do

  context 'simple template' do

    let(:tmpl) {
      DataTemplate.new(name: 'Conjurer Spell',
          template: File.read('spec/fixtures/conjurer_spell.xml'))
    }

    describe 'displayed as content' do
      it 'can render html' do
        html = tmpl.render_content
        expect(html).to_not be_nil
      end
    end

    describe 'displayed as editor' do
      it 'can render html' do
        html = tmpl.render_editor
        expect(html).to_not be_nil
      end
    end
  end
end
