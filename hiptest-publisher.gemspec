# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: hiptest-publisher 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hiptest-publisher"
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Hiptest R&D"]
  s.date = "2015-11-25"
  s.description = "Provides a command-line tool that generates Java, Python or Ruby code to run the tests."
  s.email = "contact@hiptest.net"
  s.executables = ["hiptest-publisher"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "lib/config/csharp.conf",
    "lib/config/cucumber-java.conf",
    "lib/config/cucumber.conf",
    "lib/config/java-testng.conf",
    "lib/config/java.conf",
    "lib/config/javascript-jasmine.conf",
    "lib/config/javascript.conf",
    "lib/config/python.conf",
    "lib/config/robotframework.conf",
    "lib/config/ruby-minitest.conf",
    "lib/config/ruby.conf",
    "lib/config/seleniumide.conf",
    "lib/config/specflow.conf",
    "lib/hiptest-publisher.rb",
    "lib/hiptest-publisher/actionword_indexer.rb",
    "lib/hiptest-publisher/call_arguments_adder.rb",
    "lib/hiptest-publisher/cli_options_checker.rb",
    "lib/hiptest-publisher/formatters/console_formatter.rb",
    "lib/hiptest-publisher/formatters/reporter.rb",
    "lib/hiptest-publisher/gherkin_adder.rb",
    "lib/hiptest-publisher/handlebars_helper.rb",
    "lib/hiptest-publisher/nodes.rb",
    "lib/hiptest-publisher/nodes_walker.rb",
    "lib/hiptest-publisher/options_parser.rb",
    "lib/hiptest-publisher/parameter_type_adder.rb",
    "lib/hiptest-publisher/parent_adder.rb",
    "lib/hiptest-publisher/render_context_maker.rb",
    "lib/hiptest-publisher/renderer.rb",
    "lib/hiptest-publisher/signature_differ.rb",
    "lib/hiptest-publisher/signature_exporter.rb",
    "lib/hiptest-publisher/string.rb",
    "lib/hiptest-publisher/utils.rb",
    "lib/hiptest-publisher/xml_parser.rb",
    "lib/templates/common/booleanliteral.hbs",
    "lib/templates/common/dataset.hbs",
    "lib/templates/common/datatable.hbs",
    "lib/templates/common/empty.hbs",
    "lib/templates/common/nullliteral.hbs",
    "lib/templates/common/numericliteral.hbs",
    "lib/templates/common/stringliteral.hbs",
    "lib/templates/common/variable.hbs",
    "lib/templates/csharp/_body.hbs",
    "lib/templates/csharp/_item_as_function.hbs",
    "lib/templates/csharp/_scenario.hbs",
    "lib/templates/csharp/actionword.hbs",
    "lib/templates/csharp/actionwords.hbs",
    "lib/templates/csharp/argument.hbs",
    "lib/templates/csharp/assign.hbs",
    "lib/templates/csharp/binaryexpression.hbs",
    "lib/templates/csharp/call.hbs",
    "lib/templates/csharp/dataset.hbs",
    "lib/templates/csharp/dict.hbs",
    "lib/templates/csharp/field.hbs",
    "lib/templates/csharp/ifthen.hbs",
    "lib/templates/csharp/index.hbs",
    "lib/templates/csharp/list.hbs",
    "lib/templates/csharp/nullliteral.hbs",
    "lib/templates/csharp/parameter.hbs",
    "lib/templates/csharp/parenthesis.hbs",
    "lib/templates/csharp/property.hbs",
    "lib/templates/csharp/scenario.hbs",
    "lib/templates/csharp/scenarios.hbs",
    "lib/templates/csharp/single_scenario.hbs",
    "lib/templates/csharp/single_test.hbs",
    "lib/templates/csharp/step.hbs",
    "lib/templates/csharp/stringliteral.hbs",
    "lib/templates/csharp/tag.hbs",
    "lib/templates/csharp/template.hbs",
    "lib/templates/csharp/test.hbs",
    "lib/templates/csharp/tests.hbs",
    "lib/templates/csharp/unaryexpression.hbs",
    "lib/templates/csharp/variable.hbs",
    "lib/templates/csharp/while.hbs",
    "lib/templates/cucumber/actionword.hbs",
    "lib/templates/cucumber/actionwords.hbs",
    "lib/templates/cucumber/java/actionword.hbs",
    "lib/templates/cucumber/java/actionwords.hbs",
    "lib/templates/cucumber/java/parameter.hbs",
    "lib/templates/cucumber/parameter.hbs",
    "lib/templates/gherkin/argument.hbs",
    "lib/templates/gherkin/call.hbs",
    "lib/templates/gherkin/dataset.hbs",
    "lib/templates/gherkin/datatable.hbs",
    "lib/templates/gherkin/folder.hbs",
    "lib/templates/gherkin/parameter.hbs",
    "lib/templates/gherkin/scenarios.hbs",
    "lib/templates/gherkin/single_scenario.hbs",
    "lib/templates/gherkin/single_test.hbs",
    "lib/templates/gherkin/step.hbs",
    "lib/templates/gherkin/stringliteral.hbs",
    "lib/templates/gherkin/template.hbs",
    "lib/templates/java/_body.hbs",
    "lib/templates/java/_item_as_function.hbs",
    "lib/templates/java/_scenario.hbs",
    "lib/templates/java/actionword.hbs",
    "lib/templates/java/actionwords.hbs",
    "lib/templates/java/argument.hbs",
    "lib/templates/java/assign.hbs",
    "lib/templates/java/binaryexpression.hbs",
    "lib/templates/java/call.hbs",
    "lib/templates/java/dataset.hbs",
    "lib/templates/java/dict.hbs",
    "lib/templates/java/field.hbs",
    "lib/templates/java/ifthen.hbs",
    "lib/templates/java/index.hbs",
    "lib/templates/java/list.hbs",
    "lib/templates/java/nullliteral.hbs",
    "lib/templates/java/parameter.hbs",
    "lib/templates/java/parenthesis.hbs",
    "lib/templates/java/property.hbs",
    "lib/templates/java/scenario.hbs",
    "lib/templates/java/scenarios.hbs",
    "lib/templates/java/single_scenario.hbs",
    "lib/templates/java/single_test.hbs",
    "lib/templates/java/step.hbs",
    "lib/templates/java/stringliteral.hbs",
    "lib/templates/java/tag.hbs",
    "lib/templates/java/template.hbs",
    "lib/templates/java/test.hbs",
    "lib/templates/java/testng/_scenario.hbs",
    "lib/templates/java/testng/dataset.hbs",
    "lib/templates/java/testng/scenarios.hbs",
    "lib/templates/java/testng/single_scenario.hbs",
    "lib/templates/java/testng/single_test.hbs",
    "lib/templates/java/testng/tests.hbs",
    "lib/templates/java/tests.hbs",
    "lib/templates/java/unaryexpression.hbs",
    "lib/templates/java/variable.hbs",
    "lib/templates/java/while.hbs",
    "lib/templates/javascript/_body.hbs",
    "lib/templates/javascript/_item_as_function.hbs",
    "lib/templates/javascript/_item_as_hash_key.hbs",
    "lib/templates/javascript/_module_declaration.hbs",
    "lib/templates/javascript/_scenario.hbs",
    "lib/templates/javascript/actionword.hbs",
    "lib/templates/javascript/actionwords.hbs",
    "lib/templates/javascript/argument.hbs",
    "lib/templates/javascript/assign.hbs",
    "lib/templates/javascript/binaryexpression.hbs",
    "lib/templates/javascript/call.hbs",
    "lib/templates/javascript/dataset.hbs",
    "lib/templates/javascript/dict.hbs",
    "lib/templates/javascript/field.hbs",
    "lib/templates/javascript/ifthen.hbs",
    "lib/templates/javascript/index.hbs",
    "lib/templates/javascript/jasmine/_before_each.hbs",
    "lib/templates/javascript/jasmine/_scenario.hbs",
    "lib/templates/javascript/jasmine/dataset.hbs",
    "lib/templates/javascript/jasmine/scenarios.hbs",
    "lib/templates/javascript/jasmine/single_scenario.hbs",
    "lib/templates/javascript/jasmine/single_test.hbs",
    "lib/templates/javascript/jasmine/tests.hbs",
    "lib/templates/javascript/list.hbs",
    "lib/templates/javascript/nullliteral.hbs",
    "lib/templates/javascript/parameter.hbs",
    "lib/templates/javascript/parenthesis.hbs",
    "lib/templates/javascript/project.hbs",
    "lib/templates/javascript/property.hbs",
    "lib/templates/javascript/scenario.hbs",
    "lib/templates/javascript/scenarios.hbs",
    "lib/templates/javascript/single_scenario.hbs",
    "lib/templates/javascript/single_test.hbs",
    "lib/templates/javascript/step.hbs",
    "lib/templates/javascript/tag.hbs",
    "lib/templates/javascript/template.hbs",
    "lib/templates/javascript/test.hbs",
    "lib/templates/javascript/tests.hbs",
    "lib/templates/javascript/unaryexpression.hbs",
    "lib/templates/javascript/while.hbs",
    "lib/templates/python/_body.hbs",
    "lib/templates/python/_item_as_def.hbs",
    "lib/templates/python/_parameters.hbs",
    "lib/templates/python/_scenario.hbs",
    "lib/templates/python/actionword.hbs",
    "lib/templates/python/actionwords.hbs",
    "lib/templates/python/argument.hbs",
    "lib/templates/python/assign.hbs",
    "lib/templates/python/binaryexpression.hbs",
    "lib/templates/python/call.hbs",
    "lib/templates/python/dataset.hbs",
    "lib/templates/python/dict.hbs",
    "lib/templates/python/field.hbs",
    "lib/templates/python/ifthen.hbs",
    "lib/templates/python/index.hbs",
    "lib/templates/python/list.hbs",
    "lib/templates/python/nullliteral.hbs",
    "lib/templates/python/parameter.hbs",
    "lib/templates/python/parenthesis.hbs",
    "lib/templates/python/project.hbs",
    "lib/templates/python/property.hbs",
    "lib/templates/python/scenario.hbs",
    "lib/templates/python/scenarios.hbs",
    "lib/templates/python/single_scenario.hbs",
    "lib/templates/python/single_test.hbs",
    "lib/templates/python/step.hbs",
    "lib/templates/python/tag.hbs",
    "lib/templates/python/template.hbs",
    "lib/templates/python/test.hbs",
    "lib/templates/python/tests.hbs",
    "lib/templates/python/unaryexpression.hbs",
    "lib/templates/python/while.hbs",
    "lib/templates/robotframework/_keyword.hbs",
    "lib/templates/robotframework/_scenario.hbs",
    "lib/templates/robotframework/actionword.hbs",
    "lib/templates/robotframework/actionwords.hbs",
    "lib/templates/robotframework/argument.hbs",
    "lib/templates/robotframework/call.hbs",
    "lib/templates/robotframework/dataset.hbs",
    "lib/templates/robotframework/datatable.hbs",
    "lib/templates/robotframework/ifthen.hbs",
    "lib/templates/robotframework/parameter.hbs",
    "lib/templates/robotframework/scenarios.hbs",
    "lib/templates/robotframework/single_scenario.hbs",
    "lib/templates/robotframework/single_test.hbs",
    "lib/templates/robotframework/stringliteral.hbs",
    "lib/templates/robotframework/template.hbs",
    "lib/templates/robotframework/tests.hbs",
    "lib/templates/robotframework/variable.hbs",
    "lib/templates/robotframework/while.hbs",
    "lib/templates/ruby/_body.hbs",
    "lib/templates/ruby/_item_as_def.hbs",
    "lib/templates/ruby/_scenario.hbs",
    "lib/templates/ruby/actionword.hbs",
    "lib/templates/ruby/actionwords.hbs",
    "lib/templates/ruby/argument.hbs",
    "lib/templates/ruby/assign.hbs",
    "lib/templates/ruby/binaryexpression.hbs",
    "lib/templates/ruby/call.hbs",
    "lib/templates/ruby/dataset.hbs",
    "lib/templates/ruby/dict.hbs",
    "lib/templates/ruby/field.hbs",
    "lib/templates/ruby/ifthen.hbs",
    "lib/templates/ruby/index.hbs",
    "lib/templates/ruby/list.hbs",
    "lib/templates/ruby/minitest/_item_as_def.hbs",
    "lib/templates/ruby/minitest/_scenario.hbs",
    "lib/templates/ruby/minitest/dataset.hbs",
    "lib/templates/ruby/minitest/scenario.hbs",
    "lib/templates/ruby/minitest/scenarios.hbs",
    "lib/templates/ruby/minitest/single_scenario.hbs",
    "lib/templates/ruby/minitest/single_test.hbs",
    "lib/templates/ruby/minitest/test.hbs",
    "lib/templates/ruby/minitest/tests.hbs",
    "lib/templates/ruby/parameter.hbs",
    "lib/templates/ruby/parenthesis.hbs",
    "lib/templates/ruby/project.hbs",
    "lib/templates/ruby/property.hbs",
    "lib/templates/ruby/scenario.hbs",
    "lib/templates/ruby/scenarios.hbs",
    "lib/templates/ruby/single_scenario.hbs",
    "lib/templates/ruby/single_test.hbs",
    "lib/templates/ruby/step.hbs",
    "lib/templates/ruby/tag.hbs",
    "lib/templates/ruby/template.hbs",
    "lib/templates/ruby/test.hbs",
    "lib/templates/ruby/tests.hbs",
    "lib/templates/ruby/unaryexpression.hbs",
    "lib/templates/ruby/while.hbs",
    "lib/templates/seleniumide/argument.hbs",
    "lib/templates/seleniumide/call.hbs",
    "lib/templates/seleniumide/single_test.hbs",
    "lib/templates/seleniumide/step.hbs",
    "lib/templates/seleniumide/stringliteral.hbs",
    "lib/templates/seleniumide/template.hbs",
    "lib/templates/seleniumide/test.hbs",
    "lib/templates/seleniumide/tests.hbs",
    "lib/templates/specflow/actionword.hbs",
    "lib/templates/specflow/actionwords.hbs"
  ]
  s.homepage = "https://hiptest.net"
  s.licenses = ["GPL 2"]
  s.rubygems_version = "2.4.6"
  s.summary = "Export your tests from Hiptest into executable tests."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colorize>, [">= 0.7.5", "~> 0.7"])
      s.add_runtime_dependency(%q<parseconfig>, [">= 1.0.4", "~> 1.0"])
      s.add_runtime_dependency(%q<i18n>, [">= 0.7.0", "~> 0.7"])
      s.add_runtime_dependency(%q<nokogiri>, ["= 1.6.7.rc4"])
      s.add_runtime_dependency(%q<multipart-post>, [">= 2.0.0", "~> 2.0"])
      s.add_runtime_dependency(%q<ruby-handlebars>, ["~> 0.0.2"])
      s.add_development_dependency(%q<pry>, ["~> 0"])
      s.add_development_dependency(%q<pry-byebug>, ["~> 3"])
      s.add_development_dependency(%q<pry-stack_explorer>, ["~> 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3"])
      s.add_development_dependency(%q<rspec-mocks>, ["~> 3.3"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, [">= 0.4.6", "~> 0.4"])
      s.add_development_dependency(%q<jeweler>, [">= 2.0.1", "~> 2.0"])
    else
      s.add_dependency(%q<colorize>, [">= 0.7.5", "~> 0.7"])
      s.add_dependency(%q<parseconfig>, [">= 1.0.4", "~> 1.0"])
      s.add_dependency(%q<i18n>, [">= 0.7.0", "~> 0.7"])
      s.add_dependency(%q<nokogiri>, ["= 1.6.7.rc4"])
      s.add_dependency(%q<multipart-post>, [">= 2.0.0", "~> 2.0"])
      s.add_dependency(%q<ruby-handlebars>, ["~> 0.0.2"])
      s.add_dependency(%q<pry>, ["~> 0"])
      s.add_dependency(%q<pry-byebug>, ["~> 3"])
      s.add_dependency(%q<pry-stack_explorer>, ["~> 0"])
      s.add_dependency(%q<rspec>, ["~> 3.3"])
      s.add_dependency(%q<rspec-mocks>, ["~> 3.3"])
      s.add_dependency(%q<codeclimate-test-reporter>, [">= 0.4.6", "~> 0.4"])
      s.add_dependency(%q<jeweler>, [">= 2.0.1", "~> 2.0"])
    end
  else
    s.add_dependency(%q<colorize>, [">= 0.7.5", "~> 0.7"])
    s.add_dependency(%q<parseconfig>, [">= 1.0.4", "~> 1.0"])
    s.add_dependency(%q<i18n>, [">= 0.7.0", "~> 0.7"])
    s.add_dependency(%q<nokogiri>, ["= 1.6.7.rc4"])
    s.add_dependency(%q<multipart-post>, [">= 2.0.0", "~> 2.0"])
    s.add_dependency(%q<ruby-handlebars>, ["~> 0.0.2"])
    s.add_dependency(%q<pry>, ["~> 0"])
    s.add_dependency(%q<pry-byebug>, ["~> 3"])
    s.add_dependency(%q<pry-stack_explorer>, ["~> 0"])
    s.add_dependency(%q<rspec>, ["~> 3.3"])
    s.add_dependency(%q<rspec-mocks>, ["~> 3.3"])
    s.add_dependency(%q<codeclimate-test-reporter>, [">= 0.4.6", "~> 0.4"])
    s.add_dependency(%q<jeweler>, [">= 2.0.1", "~> 2.0"])
  end
end

