class Packer < Thor
  include Thor::Actions

  desc 'build', 'Build a Packer template'
  def build(template)
    say "Updating cookbooks/", :green
    run "rm -r berks-cookbooks/"
    Berkshelf::Cli.new.invoke :vendor

    say "Building packer template '#{template}'...", :green
    run "packer build -var-file=variables.json #{template}"
  end

end