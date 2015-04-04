require 'rails_helper'

RSpec.describe "refills/_footer_2", type: :view do
  before{render}
  subject{rendered}

  describe "content" do
    it{should have_selector("footer.footer-2>div.footer-logo>img")}

    context "links" do
      context "primary" do
        let(:selector){"footer.footer-2>ul>li>a"}
        it{should have_selector(selector, text: "About")}
        it{should have_selector(selector, text: "Contact")}
      end

      context "secondary" do
        let(:selector){"footer.footer-2>div.footer-secondary-links>ul>li>a"}
        it{should have_selector(selector, text: "Terms and Conditions")}
        it{should have_selector(selector, text: "Privacy Policy")}
      end

      context "social" do
        let(:selector){"footer.footer-2>div.footer-secondary-links>ul.footer-social>li>a>img"}
        it{should have_selector(selector)}
      end
    end
  end
end
