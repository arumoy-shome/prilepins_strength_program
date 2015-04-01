require 'rails_helper'

RSpec.describe "refills/_footer_2", type: :view do
  before{render}
  subject{rendered}

  context "content" do
    describe "logo" do
      it{should have_selector("footer.footer-2>div.footer-logo>img")}
    end

    context "links" do
      describe "primary links" do
        let(:selector){"footer.footer-2>ul>li>a"}
        it{should have_selector(selector, text: "About")}
        it{should have_selector(selector, text: "Contact")}
        it{should have_selector(selector, text: "Products")}
      end

      describe "secondary links" do
        let(:selector){"footer.footer-2>div.footer-secondary-links>ul>li>a"}
        it{should have_selector(selector, text: "Terms and Conditions")}
        it{should have_selector(selector, text: "Privacy Policy")}
      end
    end
  end
end
