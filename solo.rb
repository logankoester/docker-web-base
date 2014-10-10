# See http://www.packer.io/docs/templates/configuration-templates.html for Packer configuration template docs
# See http://www.packer.io/docs/provisioners/chef-solo.html for Packer chef-solo configuration docs
# See https://docs.getchef.com/config_rb_solo.html for Chef Solo options

cookbook_path [{{.CookbookPaths}}]
environment "{{.ChefEnvironment}}"
data_bag_path "{{.DataBagsPath}}"
environments_path "{{.EnvironmentsPath}}"
role_path "{{.RolesPath}}"
ssl_verify_mode :verify_peer
