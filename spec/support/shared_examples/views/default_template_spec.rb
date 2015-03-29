shared_examples "application template" do
  it{should render_template(partial: 'refills/_centered_navigation')}
  it{should render_template(partial: 'refills/_footer_2')}
end
